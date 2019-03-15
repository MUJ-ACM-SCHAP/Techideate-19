"""
importing
"""
import cv2
from time import sleep
import csv
import numpy as np
from PIL import Image
import os
import os.path


"""
creating a file for all users/ reading the user file
"""
    
    
def add_user():

    if str(os.path.exists('people.csv'))=='True':
        with open('people.csv', 'r') as readFile:
            reader = csv.reader(readFile)
            lines = list(reader)
            id = int(lines[-1][0])
            readFile.close()
    else:
        id=-1
        row = ['id', ' name']
        with open('people.csv', 'w') as csvFile:
            writer = csv.writer(csvFile)
            writer.writerow(row)
        csvFile.close()
    
    """
    openeing cam to take images
    """
    
    cam = cv2.VideoCapture(0)
    cam.set(3, 640) # set video width
    cam.set(4, 480) # set video height
    
    face_detector = cv2.CascadeClassifier('haarcascade_frontalface_default.xml')
    name = input('\n Enter user name ==>  ')
    
    print("\n [INFO] Initializing face capture. Look the camera and wait ...")
    # Initialize individual sampling face count
    id=id+1
    
    row = [id, name]
    
    with open('people.csv', 'a') as csvFile:
        writer = csv.writer(csvFile)
        writer.writerow(row)
    
    csvFile.close()
    
    def dataset_creation():
        sleep(2)
        c=0
        while(True):
            ret, img = cam.read()
            gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
            faces = face_detector.detectMultiScale(gray, 1.3, 5)
        
            for (x,y,w,h) in faces:
                cv2.rectangle(img, (x,y), (x+w,y+h), (255,0,0), 2)     
                c += 1
                cv2.imwrite("dataset/User." + str(id) + '.' + str(c) + ".jpg", gray[y:y+h,x:x+w])
                cv2.imshow('image', img)
        
            k = cv2.waitKey(100) & 0xff # Press 'ESC' for exiting video
            if k == 27:
                break
            elif c >= 50: # Take 20 face sample and stop video
                 break
        #cam.release()
        return 0
    
    
    print('look into the web cam')
    dataset_creation()
    cv2.destroyAllWindows()
    
    
    cam.release()
    cv2.destroyAllWindows()
    
    
    """
    training the model after data base creation
    """
    # Path for face image database
    path = 'dataset'
    
    recognizer = cv2.face.LBPHFaceRecognizer_create()
    detector = cv2.CascadeClassifier("haarcascade_frontalface_default.xml");
    
    # function to get the images and label data
    def getImagesAndLabels(path):
    
        imagePaths = [os.path.join(path,f) for f in os.listdir(path)]     
        faceSamples=[]
        ids = []
    
        for imagePath in imagePaths:
    
            PIL_img = Image.open(imagePath).convert('L') # convert it to grayscale
            img_numpy = np.array(PIL_img,'uint8')
    
            id = int(os.path.split(imagePath)[-1].split(".")[1])
            faces = detector.detectMultiScale(img_numpy)
    
            for (x,y,w,h) in faces:
                faceSamples.append(img_numpy[y:y+h,x:x+w])
                ids.append(id)
    
        return faceSamples,ids
    
    print ("\nTraining faces. It will take a few seconds. Wait ...")
    faces,ids = getImagesAndLabels(path)
    recognizer.train(faces, np.array(ids))
    
    # Save the model into trainer/trainer.yml
    recognizer.write('trainer/trainer.yml') # recognizer.save() worked on Mac, but not on Pi
    
    # Print the numer of faces trained and end program
    print("\n{0} faces trained. Exiting Program".format(len(np.unique(ids))))



"""
camera
"""
    
def camera():

    recognizer = cv2.face.LBPHFaceRecognizer_create()
    recognizer.read('trainer/trainer.yml')
    cascadePath = "haarcascade_frontalface_default.xml"
    faceCascade = cv2.CascadeClassifier(cascadePath);
    
    font = cv2.FONT_HERSHEY_SIMPLEX
    """
    if no user exists
    """
    if str(os.path.exists('people.csv'))=='False':
        cap = cv2.VideoCapture(0)
        if cap.isOpened():
            ret, frame = cap.read()
        else:
            ret = False
        while ret:
            ret, frame =cap.read()
            cv2.imshow("Live",frame)
            if cv2.waitKey(1)==27:
                cap.release()
                cv2.destroyAllWindows()
                main()
    
    #iniciate id counter
    id = 0
    
    if str(os.path.exists('people.csv'))=='False':
        with open('people.csv', 'r') as readFile:
            reader = csv.reader(readFile)
            lines = list(reader)
            id = int(lines[-1][0])
            readFile.close()
    # names related to ids: example ==> Marcelo: id=1,  etc
    
    with open('people.csv', 'r') as readFile:
        reader = csv.reader(readFile)
        lines = list(reader)
        a=np.asarray(lines)
        c = a.shape[0]
        names = [None] * c
        #pdb.set_trace()
        for i in range(1, c): 
            names[i]=lines[i][1]  #names = names + lines[i][1]
    
    
    
    # Initialize and start realtime video capture
    cam = cv2.VideoCapture(0)
    cam.set(3, 640) # set video widht
    cam.set(4, 480) # set video height
    
    # Define min window size to be recognized as a face
    minW = 0.1*cam.get(3)
    minH = 0.1*cam.get(4)
    
    while True:
    
        ret, img =cam.read()
    
        gray = cv2.cvtColor(img,cv2.COLOR_BGR2GRAY)
    
        faces = faceCascade.detectMultiScale( 
            gray,
            scaleFactor = 1.2,
            minNeighbors = 5,
            minSize = (int(minW), int(minH)),
           )
    
        for(x,y,w,h) in faces:
    
            cv2.rectangle(img, (x,y), (x+w,y+h), (0,255,0), 2)
    
            id, confidence = recognizer.predict(gray[y:y+h,x:x+w])
    
            # Check if confidence is less them 100 ==> "0" is perfect match 
            if (confidence < 100):
                id = names[id+1]
                confidence = "  {0}%".format(round(100 - confidence))
            else:
                id = "Unknown"
                confidence = "  {0}%".format(round(100 - confidence))
            
            cv2.putText(img, str(id), (x+5,y-5), font, 1, (255,255,255), 2)
        
        cv2.imshow('camera',img) 
    
        k = cv2.waitKey(10) & 0xff # Press 'ESC' for exiting video
        if k == 27:
            break

    cam.release()
    cv2.destroyAllWindows()

def main():
    print('\nWelcome to Secure It\n')
    a=int(input('\nPress the respective key\n1-->Add a New Member\n2-->Look for Camera\n3-->Exit\n-->Enter here->'))
    
    if a==1:
        add_user()
        main()
    elif a==2:
        camera()
        main()
    elif a==3:
        exit()
    else:
        main()
if __name__== "__main__" :
    main()