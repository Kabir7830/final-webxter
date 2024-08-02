def otpTemplate(otp,email):
    otp_template = f"""
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Signup OTP</title>
            <style>
                body {{
                    font-family: Arial, sans-serif;
                    background-color: #f4f4f4;
                    margin: 0;
                    padding: 0;
                }}
                .container {{
                    max-width: 600px;
                    margin: 20px auto;
                    background-color: #2cb297;
                    padding: 20px;
                    border-radius: 5px;
                    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                }}
                h2 {{
                    color: white;
                }}
                p {{
                    color: white;
                    line-height: 1.6;
                }}
                .otp {{
                    font-size: 24px;
                    font-weight: bold;
                    padding: 10px 20px;
                    background-color: #007bff;
                    color: #fff;
                    border-radius: 5px;
                    display: inline-block;
                    margin-top: 20px;
                }}
                .note {{
                    font-style: italic;
                    color: whitesmoke;
                    margin-top: 10px;
                }}
            </style>
        </head>
        <body>
            <div class="container">
                <h2>Dear {email},</h2>
                <p>Thank you for signing up for our platform. Your One-Time Password (OTP) for account verification is:</p>
                <div class="otp">{otp}</div>
                <p class="note">Please use this OTP to complete the signup process. The OTP will expire in 5 minutes.</p>
                <p>If you have any questions or need further assistance, please don't hesitate to contact us.</p>
                <p>Best regards,<br> Webxter</p>
            </div>
        </body>
        </html>
    """

    return otp_template


def AccountCreatedTemplate(name):

    account_created_template = f"""

    <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Welcome to Webxter</title>
            <style>
                body {{
                    font-family: Arial, sans-serif;
                    background-color: #f4f4f4;
                    margin: 0;
                    padding: 0;
                }}
                .container {{
                    max-width: 600px;
                    margin: 20px auto;
                    padding: 20px;
                    background-color: #2cb297;
                    border-radius: 8px;
                    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                }}
                h1 {{
                    color: white;
                    text-align: center;
                }}
                p {{
                    color: white;
                    line-height: 1.6;
                }}
                .button {{
                    display: inline-block;
                    background-color: #007bff;
                    color: white;
                    text-decoration: none;
                    padding: 10px 20px;
                    border-radius: 4px;
                    margin-top: 20px;
                }}
            </style>
        </head>
        <body>
            <div class="container">
                <h1>Welcome to Webxter</h1>
                <p>Dear {str(name).upper()},</p>
                <p>Thank you for creating an account with us. You are now part of our community!</p>
                <p>Feel free to explore our platform and discover all the amazing features we offer.</p>
                <p>If you have any questions or need assistance, don't hesitate to contact us.</p>
                <a href="https://webxter.in" class="button">Explore Now</a>
                <p>Best regards,<br> 
                Webxter</p>
            </div>
        </body>
        </html>

        """
    return account_created_template


def EnrollmentTemplate(name,course_name):

    enrollment_template = f"""
        <!DOCTYPE html>
        <html lang="en">
        <head>
        
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Thankyou for Enrolling</title>
            <style>
                body {{
                    font-family: Arial, sans-serif;
                    margin: 0;
                    padding: 0;
                }}
                .container {{
                    max-width: 600px;
                    margin: 20px auto;
                    background-color: #2cb297;
                    padding: 20px;
                    border-radius: 5px;
                    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                }}
                h2 {{
                    color:white;
                }}
                p {{
                    color: white;
                    line-height: 1.6;
                }}
                .button {{
                    display: inline-block;
                    background-color: white;
                    color: #fff;
                    text-decoration: none;
                    padding: 10px 20px;
                    border-radius: 5px;
                    margin-top: 20px;
                }}
            </style>
        </head>
        <body>
            <div class="container">
                <h2>Dear {str(name).upper()},</h2>
                <p>Thank you for your interest in our course "<strong>{course_name}</strong>".</p>
                <p>We have received your enrollment request, and our team will contact you shortly to provide further details.</p>
                <p>If you have any questions or require immediate assistance, please feel free to contact us at the given number</p>
                <p>Contact: <strong>+91 7355017830</strong></p>
                <a href="https://webxter.in" class="button">Visit Our Website</a>
                <p>Best regards,<br> Webxter</p>
            </div>
        </body>
        </html>

    """

    return enrollment_template


def CallbackRequestTemplate(name,email,phone_number,message):

    callback_request_template = f"""

    <!DOCTYPE html>
        <html lang="en">
        <head>
        
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Thankyou for Enrolling</title>
            <style>
                body {{
                    font-family: Arial, sans-serif;
                    margin: 0;
                    padding: 0;
                }}
                .container {{
                    max-width: 600px;
                    margin: 20px auto;
                    background-color: #2cb297;
                    padding: 20px;
                    border-radius: 5px;
                    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                }}
                h2 {{
                    color:white;
                }}
                p {{
                    color: white;
                    line-height: 1.6;
                }}
                .button {{
                    display: inline-block;
                    background-color: white;
                    color: #fff;
                    text-decoration: none;
                    padding: 10px 20px;
                    border-radius: 5px;
                    margin-top: 20px;
                }}
            </style>
        </head>
        <body>
            <div class="container">
                <h2>A new student requested for callback</h2>
                <p>A new student just now requested for a callback </p>
                <p> 
                    Name : {name} 
                    <br>
                    Email : {email}
                    <br>
                    Phone Number : {phone_number}
                    <br>
                    Message : {message}
                </p>
            </div>
        </body>
        </html>
    """
    return callback_request_template



def callbackSentTemplate(name):

    callback_sent_template = f"""

    <!DOCTYPE html>
        <html lang="en">
        <head>
        
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Thankyou for Enrolling</title>
            <style>
                body {{
                    font-family: Arial, sans-serif;
                    margin: 0;
                    padding: 0;
                }}
                .container {{
                    max-width: 600px;
                    margin: 20px auto;
                    background-color: #2cb297;
                    padding: 20px;
                    border-radius: 5px;
                    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                }}
                h2 {{
                    color:white;
                }}
                p {{
                    color: white;
                    line-height: 1.6;
                }}
                .button {{
                    display: inline-block;
                    background-color: white;
                    color: #fff;
                    text-decoration: none;
                    padding: 10px 20px;
                    border-radius: 5px;
                    margin-top: 20px;
                }}
            </style>
        </head>
        <body>
            <div class="container">
                <h2>Dear {str(name).upper()} 
                <br> 
                    Thank you for submitting the callback request form</h2>
                <p> 
                   Thank you for submitting the callback request form. We appreciate your interest in connecting with us.
                    <br>
                    <br>
                    Our team will review your submission promptly and aim to get back to you within 1-2 business days. We understand the importance of your query and will strive to address it comprehensively.
                    <br>
                    <br>
                    In the meantime, if you have any urgent inquiries or require immediate assistance, please feel free to reach out to us at <strong>7355017830</strong>.
                    <br>
                    <br>
                    Thank you once again for reaching out to us. We look forward to assisting you further.
                    <br>
                    <br>
                    Best regards,
                    <br>
                    Webxter
                </p>
            </div>
            
        </body>
        </html>


    """
    return callback_sent_template

def DemoClassRegestrationTemplate(name,course_name,time_slot,date_slot):
    
    demo_class_regeatration_template = f"""
    
    <!DOCTYPE html>
        <html lang="en">
        <head>
        
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Thankyou for Enrolling</title>
            <style>
                body {{
                    font-family: Arial, sans-serif;
                    margin: 0;
                    padding: 0;
                }}
                .container {{
                    max-width: 600px;
                    margin: 20px auto;
                    /* background-color: #2cb297; */
                    background-color: white;
                    padding: 20px;
                    border-radius: 5px;
                    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                }}
                h2 {{
                    color:black;
                }}
                p {{
                    color: black;
                    line-height: 1.6;
                }}
                .button {{
                    display: inline-block;
                    background-color: #2cb297;
                    color: white;
                    text-decoration: none;
                    padding: 10px 20px;
                    border-radius: 5px;
                    margin-top: 20px;
                }}
            </style>
        </head>
        <body>
            <div class="container">
                <img src="https://webxter.in/media/logo/webxter_logo_no_bg_NENaBWN.png" width="100px" height="auto"/>
                <h2>Dear {str(name).upper()},</h2>
                <p>We are thrilled to confirm your booking for a demo class on our website. Below are the details of your scheduled session:</p>
                <p>
                Course: {course_name} <br>
                Date: {date_slot} <br>
                Time: {time_slot}
                </p>
                <p>Our instructor, is looking forward to meeting you and providing a 
                comprehensive overview of the course. This demo class is a great opportunity for you to 
                understand the course content, teaching style, and ask any questions you might have.</p>
                <p><strong>Joining Instructions:</strong></p>
                <p>You will receive an email with a join link 24 hours before your demo class. Please use this link to access the session at the scheduled time.
                </p>
                <p>
                If you have any issues accessing the class or need to reschedule, please do not hesitate to contact our support team at info@webxter.in or +91 7355017830.</p>
                <p>Thank you for choosing <strong>Webxter</strong>. We are excited to help you achieve your learning goals.</p>
                <a href="https://webxter.in" class="button">Visit Our Website</a>
                <p>Best regards,<br> Webxter</p>
            </div>
            
            <span><a href="https://webxter.in/unsubscribe" style="font-size:5px;">unsubscribe</span>
        </body>
        </html>
    
    
    """
    return demo_class_regeatration_template


def AdminDemoClassRegestrationTemplate(name,email,course_name,contact_number,alternate_number,time_slot,date_slot,date_of_birth,gender):
    
    demo_class_regeatration_template = f"""
    
    <!DOCTYPE html>
        <html lang="en">
        <head>
        
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Thankyou for Enrolling</title>
            <style>
                body {{
                    font-family: Arial, sans-serif;
                    margin: 0;
                    padding: 0;
                }}
                .container {{
                    max-width: 600px;
                    margin: 20px auto;
                    /* background-color: #2cb297; */
                    background-color: white;
                    padding: 20px;
                    border-radius: 5px;
                    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                }}
                h2 {{
                    color:black;
                }}
                p {{
                    color: black;
                    line-height: 1.6;
                }}
                .button {{
                    display: inline-block;
                    background-color: #2cb297;
                    color: white;
                    text-decoration: none;
                    padding: 10px 20px;
                    border-radius: 5px;
                    margin-top: 20px;
                }}
            </style>
        </head>
        <body>
            <div class="container">
            <img src="https://webxter.in/media/logo/webxter_logo_no_bg_NENaBWN.png" width="100px" height="auto"/>
                <h2>Dear {str(name).upper()},</h2>
                <p>We are thrilled to confirm your booking for a demo class on our website. Below are the details of your scheduled session:</p>
                <p>
                Course: {course_name} <br>
                Date: {date_slot} <br>
                Time: {time_slot}
                </p>
                <p>Our instructor, is looking forward to meeting you and providing a 
                comprehensive overview of the course. This demo class is a great opportunity for you to 
                understand the course content, teaching style, and ask any questions you might have.</p>
                <p><strong>Joining Instructions:</strong></p>
                <p>You will receive an email with a join link 24 hours before your demo class. Please use this link to access the session at the scheduled time.
                </p>
                <p>
                If you have any issues accessing the class or need to reschedule, please do not hesitate to contact our support team at info@webxter.in or +91 7355017830.</p>
                <p>Thank you for choosing <strong>Webxter</strong>. We are excited to help you achieve your learning goals.</p>
                <a href="https://webxter.in" class="button">Visit Our Website</a>
                <p>Best regards,<br> Webxter</p>
                
                <h2>Admin Details</h2>
                <h2>Dear Admin,</h2>
                <p>New Regestration for Demo Class:</p>
                <p>
                Name : {name} <br>
                email : {email} <br>
                Contact Number : {contact_number} <br>
                Alternate Number : {alternate_number} <br>
                DOB: {date_of_birth} <br>
                Gender: {gender} <br>
                Course: {course_name} <br>
                Date: {date_slot} <br>
                Time: {time_slot}
                </p>
                <p>This is an automated response.</p>
            </div>
             <span><a href="https://webxter.in/unsubscribe" style="font-size:5px;">unsubscribe</span>
        </body>
        </html>
    
    
    """
    return demo_class_regeatration_template