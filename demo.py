import os

print("Options are:")
print("1. Chrome")
print("2. Notepad")
print("3. Web Browser")
print("4. YouTube")
print("5.Linkedin ")
print("6. Email ")
print("7.whatsapp message")
print("8.capturing video and display the face.")


while True:
    try:
        ch = int(input("Enter your choice : "))

        if ch == 1:
            os.system("start chrome")
            break
        elif ch == 2:
            os.system("start notepad")
            break
        elif ch == 3:
            os.system("start")
            break

        elif ch == 4:
            os.system("start https://www.youtube.com")
            break

        elif ch == 5:
            os.system("start https://www.linkedin.com")
            break

        elif ch == 6:
            os.system("start mailto:youremail@example.com")
            break

        elif ch == 7:

            import pywhatkit as pwk
            pwk.sendwhatmsg_instantly(
                "+916305700243", "hi, this is a message sent by Python code")
            break

        elif ch == 8:
            import cv2
            cap = cv2.VideoCapture(0)
            while True:
                status, photo = cap.read()
                x = photo[100:300, 250:450]
                photo[0:200, 0:200] = x
                cv2.imshow("my photo", photo)
                if cv2.waitKey(1) == 13:
                    break
            cv2.destroyAllWindows()
            cap.release()

            break

        else:
            print("Invalid choice!...")

    except ValueError:
        print("Invalid input! Please enter a number.")
