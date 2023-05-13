import cv2
import pytesseract
import webbrowser

cap = cv2.VideoCapture(0)

characters = []


def open_website(char):
    websites = {
        'a': 'https://www.google.com/',
        'b': 'https://www.instagram.com/',
        'c': 'https://mail.google.com/',
        'd': 'https://www.facebook.com/'
    }
    webbrowser.open_new_tab(websites.get(char))


cap.set(cv2.CAP_PROP_FRAME_WIDTH, 640)
cap.set(cv2.CAP_PROP_FRAME_HEIGHT, 480)

while True:
    ret, frame = cap.read()
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    thresh = cv2.adaptiveThreshold(gray, 255, cv2.ADAPTIVE_THRESH_GAUSSIAN_C, cv2.THRESH_BINARY, 11, 2)
    contours, hierarchy = cv2.findContours(thresh, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)

    for cnt in contours:
        x, y, w, h = cv2.boundingRect(cnt)
        area = cv2.contourArea(cnt)
        if 100 < area < 1000 and w > 10 and h > 20:
            character = pytesseract.image_to_string \
            (thresh[y:y+h, x:x+w], config='-c tessedit_char_whitelist=abcdefghijklmnopqrstu -psm 10')
            characters.append(character)
            cv2.rectangle(frame, (x, y), (x+w, y+h), (0, 255, 0), 2)
            cv2.putText(frame, character, (x, y-10), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 255, 0), 2)

    joined_characters = ''.join(characters)
    if 'abcd' in joined_characters.lower():
        open_website(joined_characters.lower())
        characters = []
    cv2.imshow('frame', frame)

    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

cap.release()
cv2.destroyAllWindows()
