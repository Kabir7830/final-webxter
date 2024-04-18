# Import the following module
from email.mime.text import MIMEText
from email.mime.image import MIMEImage
from email.mime.application import MIMEApplication
from email.mime.multipart import MIMEMultipart
import smtplib
import os


def message(subject="Python Notification", text="test mail"):
  # build message contents
  msg = MIMEMultipart()
  # Add Subject
  msg['Subject'] = subject
  # Add text contents
  msg.attach(MIMEText(text))
  return msg
  
  
def send_mail(subject1="New Enrollment",message1="A new student just enrolled!",mail_list=["kabir.behal7830@gmail.com","info@webxter.in"]):
    smtp = smtplib.SMTP('smtp.gmail.com', 587)
    smtp.starttls()
    smtp.ehlo()
    # Login with your email and password
    smtp.login('webxterwebs@gmail.com', 'okjc ywrs exsz mfkm')
    to = mail_list
    msg = message(subject=f"{subject1}",text=f"{message1}")
    # Provide some data to the sendmail function!
    smtp.sendmail(from_addr="webxterwebs@gmail.com", to_addrs=to, msg=msg.as_string())

    # Finally, don't forget to close the connection
    smtp.quit()



