import cv2
import face_recognition
import numpy as np
import pickle
import pyttsx3
import os
from datetime import datetime
from django.core.files.base import ContentFile
from .models import *
from django.conf import settings

def detection(username):
    # Initialize the TTS engine
    engine = pyttsx3.init()

    # Load the trained face recognition model
    with open('static/face/face_recognition_model.pkl', 'rb') as f:
        model = pickle.load(f)

    # Initialize the webcam
    cap = cv2.VideoCapture(0)

    # Load the face detector
    face_cascade = cv2.CascadeClassifier('static/face/haarcascade_frontalface_default.xml')

    print("Press 'q' to quit.")

    while True:
        # Capture frame-by-frame
        ret, frame = cap.read()

        # Convert to grayscale
        gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

        # Detect faces
        faces = face_cascade.detectMultiScale(gray, scaleFactor=1.1, minNeighbors=5, minSize=(30, 30))

        for (x, y, w, h) in faces:
            # Draw rectangle
            cv2.rectangle(frame, (x, y), (x + w, y + h), (255, 0, 0), 2)

            # Extract face
            face_image = frame[y:y + h, x:x + w]

            # Convert to RGB for face_recognition
            face_rgb = cv2.cvtColor(face_image, cv2.COLOR_BGR2RGB)

            # Encode face
            face_encoding = face_recognition.face_encodings(face_rgb)

            if len(face_encoding) > 0:
                face_encoding = face_encoding[0]

                # Predict
                predicted_label = model.predict([face_encoding])
                confidence_values = model.predict_proba([face_encoding])
                confidence = max(confidence_values[0])

                label = None
                if confidence > 0.95:
                    label = predicted_label[0]
                    result_text = f"The person in front of you is {label}."
                    kin = Kin.objects.filter(name=label).first()
                    if kin:
                        result_text += kin.description
                    cv2.putText(frame, f"Predicted: {label} ({confidence*100:.2f}%)", (x, y - 10),
                                cv2.FONT_HERSHEY_SIMPLEX, 0.9, (0, 255, 0), 2)
                else:
                    result_text = "This is an unknown person."
                    cv2.putText(frame, "Predicted: Unknown Person", (x, y - 10),
                                cv2.FONT_HERSHEY_SIMPLEX, 0.9, (0, 0, 255), 2)

                    # Save unknown face image
                    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
                    filename = f"unknown_{timestamp}.jpg"
                    unknown_dir = os.path.join(settings.MEDIA_ROOT, "unknown_faces")
                    os.makedirs(unknown_dir, exist_ok=True)
                    unknown_image_path = os.path.join(unknown_dir, filename)

                    # Save image to folder
                    cv2.imwrite(unknown_image_path, frame)
                    print(f"Saved unknown face at: {unknown_image_path}")

                    # Save to DB with relative path
                    UnknownFaces.objects.create(username=username, image=f"unknown_faces/{filename}")

                # Speak out result
                engine.say(result_text)
                engine.runAndWait()

        # Show the frame
        cv2.imshow('Face Prediction', frame)

        # Break on 'q'
        key = cv2.waitKey(1) & 0xFF
        if key == ord('q'):
            break

    # Release camera
    cap.release()
    cv2.destroyAllWindows()
