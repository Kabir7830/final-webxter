def otpTemplate(otp,email):
    otp_template = f"""
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Email Verification OTP</title>
        </head>
        <body style="background-color: #f8f8f8; margin: 0; padding: 0;">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#f8f8f8">
                <tr>
                    <td>
                        <table width="600" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff" align="center" style="border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
                            <tr>
                                <td bgcolor="#273c75" style="padding: 20px; text-align: center; color: #ffffff; border-top-left-radius: 8px; border-top-right-radius: 8px;">
                                    <h1 style="margin: 0; font-size: 24px; font-family: Arial, sans-serif;">Email Verification</h1>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 20px; font-family: Arial, sans-serif; color: #444;">
                                    <h2 style="color: #273c75;">Hi {email},</h2>
                                    <p style="line-height: 1.6;">Thank you for registering with Webxter! To complete your registration, please use the OTP provided below to verify your email address.</p>
                                    <p style="font-size: 24px; font-weight: bold; text-align: center; line-height: 1.6; color: #273c75;">[{otp}]</p>
                                    <p style="line-height: 1.6;">If you did not request this verification, please disregard this email. If you encounter any issues or have any questions, please contact us at <a href="mailto:info@webxter.in" style="color: #fbc531; text-decoration: none;">info@webxter.in</a> or call us at +91 735-501-7830.</p>
                                </td>
                            </tr>
                            <tr>
                                <td bgcolor="#273c75" style="padding: 20px; text-align: center; color: #ffffff; border-bottom-left-radius: 8px; border-bottom-right-radius: 8px;">
                                    <p style="margin: 0;">© 2024 Webxter. All rights reserved.</p>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </body>
        </html>

        """

    return otp_template


def signup_template(name):

    account_created_template = f"""

    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Welcome to Webxter</title>
    </head>
    <body style="background-color: #f8f8f8; margin: 0; padding: 0;">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#f8f8f8">
            <tr>
                <td>
                    <table width="600" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff" align="center" style="border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
                        <tr>
                            <td bgcolor="#273c75" style="padding: 20px; text-align: center; color: #ffffff; border-top-left-radius: 8px; border-top-right-radius: 8px;">
                                <h1 style="margin: 0; font-size: 24px; font-family: Arial, sans-serif;">Welcome to Webxter!</h1>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding: 20px; font-family: Arial, sans-serif; color: #444;">
                                <h2 style="color: #273c75;">Hello {name},</h2>
                                <p style="line-height: 1.6;">Thank you for signing up with Webxter. We are thrilled to have you join our community of passionate learners and professionals. Our platform is dedicated to helping you gain the skills you need to succeed in the world of technology and development.</p>
                                <p style="line-height: 1.6;">Feel free to explore our latest courses and get started on your learning journey. We are here to support you at every step!</p>
                                <p><strong>Login to your account:</strong> <a href="https://webxter.in/login" style="color: #fbc531; text-decoration: none;">Login</a></p>
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#273c75" style="padding: 20px; text-align: center; color: #ffffff; border-bottom-left-radius: 8px; border-bottom-right-radius: 8px;">
                                <p style="margin: 0;">Need help? Contact us at <a href="mailto:info@webxter.in" style="color: #fbc531; text-decoration: none;">info@webxter.in</a> or call us at +91 735-501-7830</p>
                                <p style="margin: 0;">© 2024 Webxter. All rights reserved.</p>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </body>
    </html>


        """
    return account_created_template


def EnrollmentTemplate(name,course):

    enrollment_template = f"""
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Course Enrollment Confirmation</title>
        </head>
        <body style="background-color: #f8f8f8; margin: 0; padding: 0;">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#f8f8f8">
                <tr>
                    <td>
                        <table width="600" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff" align="center" style="border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
                            <tr>
                                <td bgcolor="#273c75" style="padding: 20px; text-align: center; color: #ffffff; border-top-left-radius: 8px; border-top-right-radius: 8px;">
                                    <h1 style="margin: 0; font-size: 24px; font-family: Arial, sans-serif;">Course Enrollment Confirmed!</h1>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 20px; font-family: Arial, sans-serif; color: #444;">
                                    <h2 style="color: #273c75;">Hi [User Name],</h2>
                                    <p style="line-height: 1.6;">We are excited to let you know that you have successfully enrolled in the <strong>{course.course_name}</strong> course. Get ready to dive into a world of knowledge and take your skills to the next level!</p>
                                    <p style="line-height: 1.6;">Here are your course details:</p>
                                    <ul style="line-height: 1.6; padding-left: 20px;">
                                        <li><strong>Course:</strong> {course.course_name}</li>
                                        <li><strong>Duration:</strong> {course.duration} (weeks)</li>
                                    </ul>
                                    <p style="line-height: 1.6;">You can access your course materials anytime by logging into your account.</p>
                                    <p><a href="https://webxter.in/login" style="color: #fbc531; text-decoration: none;">Login to your account</a></p>
                                </td>
                            </tr>
                            <tr>
                                <td bgcolor="#273c75" style="padding: 20px; text-align: center; color: #ffffff; border-bottom-left-radius: 8px; border-bottom-right-radius: 8px;">
                                    <p style="margin: 0;">Need help? Contact us at <a href="mailto:info@webxter.in" style="color: #fbc531; text-decoration: none;">info@webxter.in</a> or call us at +91 735-501-7830</p>
                                    <p style="margin: 0;">© 2024 Webxter. All rights reserved.</p>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
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
            <title>Call Back Request Confirmation</title>
        </head>
        <body style="background-color: #f8f8f8; margin: 0; padding: 0;">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#f8f8f8">
                <tr>
                    <td>
                        <table width="600" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff" align="center" style="border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
                            <tr>
                                <td bgcolor="#273c75" style="padding: 20px; text-align: center; color: #ffffff; border-top-left-radius: 8px; border-top-right-radius: 8px;">
                                    <h1 style="margin: 0; font-size: 24px; font-family: Arial, sans-serif;">Call Back Request Received!</h1>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 20px; font-family: Arial, sans-serif; color: #444;">
                                    <h2 style="color: #273c75;">Hi {name},</h2>
                                    <p style="line-height: 1.6;">Thank you for submitting your request for a call back. One of our team members will get in touch with you shortly to assist with your inquiry.</p>
                                    <p style="line-height: 1.6;">Here are the details of your request:</p>
                                    <ul style="line-height: 1.6; padding-left: 20px;">
                                        <li><strong>Name:</strong> {name}</li>
                                        <li><strong>Phone Number:</strong> {phone_number}</li>
                                        <li><strong>Email:</strong> {email}</li>
                                        <li><strong>Message:</strong> {message}</li>
                                    </ul>
                                    <p style="line-height: 1.6;">We appreciate your interest in Webxter and look forward to speaking with you soon. If you have any immediate questions, feel free to reach us at <a href="mailto:info@webxter.in" style="color: #fbc531; text-decoration: none;">info@webxter.in</a> or call us at +91 735-501-7830.</p>
                                </td>
                            </tr>
                            <tr>
                                <td bgcolor="#273c75" style="padding: 20px; text-align: center; color: #ffffff; border-bottom-left-radius: 8px; border-bottom-right-radius: 8px;">
                                    <p style="margin: 0;">Visit our website for more information: <a href="https://webxter.in" style="color: #fbc531; text-decoration: none;">Webxter.in</a></p>
                                    <p style="margin: 0;">© 2024 Webxter. All rights reserved.</p>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </body>
        </html>

    """
    
    return callback_request_template


def DemoClassRegestrationTemplate(name,course_name,time_slot,date_slot):
    
    demo_class_regeatration_template = f"""
    
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Course Demo Registration Confirmation</title>
        </head>
        <body style="background-color: #f8f8f8; margin: 0; padding: 0;">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#f8f8f8">
                <tr>
                    <td>
                        <table width="600" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff" align="center" style="border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
                            <tr>
                                <td bgcolor="#273c75" style="padding: 20px; text-align: center; color: #ffffff; border-top-left-radius: 8px; border-top-right-radius: 8px;">
                                    <h1 style="margin: 0; font-size: 24px; font-family: Arial, sans-serif;">Course Demo Registration Confirmed!</h1>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 20px; font-family: Arial, sans-serif; color: #444;">
                                    <h2 style="color: #273c75;">Hi {name},</h2>
                                    <p style="line-height: 1.6;">Thank you for registering for a demo session with Webxter! We're excited to give you a firsthand look at our courses and what they offer.</p>
                                    <p style="line-height: 1.6;">Here are the details of your demo session:</p>
                                    <ul style="line-height: 1.6; padding-left: 20px;">
                                        <li><strong>Course Demo:</strong> {course_name}</li>
                                        <li><strong>Demo Date:</strong> {date_slot}</li>
                                        <li><strong>Time:</strong> {time_slot}</li>
                                        <li><strong>Mode:</strong> Online</li>
                                    </ul>
                                    <p style="line-height: 1.6;">You will receive a reminder email with the meeting link and other details closer to the demo date. If you have any questions in the meantime, feel free to reach out at <a href="mailto:info@webxter.in" style="color: #fbc531; text-decoration: none;">info@webxter.in</a> or call us at +91 735-501-7830.</p>
                                </td>
                            </tr>
                            <tr>
                                <td bgcolor="#273c75" style="padding: 20px; text-align: center; color: #ffffff; border-bottom-left-radius: 8px; border-bottom-right-radius: 8px;">
                                    <p style="margin: 0;">Explore more courses on our website: <a href="https://webxter.in" style="color: #fbc531; text-decoration: none;">Webxter.in</a></p>
                                    <p style="margin: 0;">© 2024 Webxter. All rights reserved.</p>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
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


def certificate_validation_template(certificate,status):
    if certificate is not None:
        template = f"""

            <!DOCTYPE html>
            <html lang="en">
            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Course Certificate Validation Status</title>
            </head>
            <body style="background-color: #f8f8f8; margin: 0; padding: 0;">
                <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#f8f8f8">
                    <tr>
                        <td>
                            <table width="600" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff" align="center" style="border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
                                <tr>
                                    <td bgcolor="#273c75" style="padding: 20px; text-align: center; color: #ffffff; border-top-left-radius: 8px; border-top-right-radius: 8px;">
                                        <h1 style="margin: 0; font-size: 24px; font-family: Arial, sans-serif;">Course Certificate Validation Status</h1>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 20px; font-family: Arial, sans-serif; color: #444;">
                                        <p style="line-height: 1.6;">Thank you for checking the validity of your course certificate with Webxter. We have reviewed your certificate details, and here is the validation status:</p>
                                        <p style="line-height: 1.6;"><strong>Certificate Number:</strong> #{certificate.certificate_number}</p>
                                        <p style="line-height: 1.6;"><strong>Course Name:</strong> {certificate.course.course_name}</p>
                                        <p style="line-height: 1.6;"><strong>Validation Status:</strong>{status} </p>
                                        <p style="line-height: 1.6;">If your certificate is invalid, please ensure that you have entered the correct certificate number. If you believe this is a mistake or need further assistance, please contact us at <a href="mailto:info@webxter.in" style="color: #fbc531; text-decoration: none;">info@webxter.in</a> or call us at +91 735-501-7830.</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td bgcolor="#273c75" style="padding: 20px; text-align: center; color: #ffffff; border-bottom-left-radius: 8px; border-bottom-right-radius: 8px;">
                                        <p style="margin: 0;">For more information about our courses, visit our website: <a href="https://webxter.in" style="color: #fbc531; text-decoration: none;">Webxter.in</a></p>
                                        <p style="margin: 0;">© 2024 Webxter. All rights reserved.</p>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </body>
            </html>


        """
        return template


def certificate_invalidation_template(email,certificate_number):
        template = f"""

            <!DOCTYPE html>
            <html lang="en">
            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Invalid Certificate or No Association Found</title>
            </head>
            <body style="background-color: #f8f8f8; margin: 0; padding: 0;">
                <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#f8f8f8">
                    <tr>
                        <td>
                            <table width="600" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff" align="center" style="border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
                                <tr>
                                    <td bgcolor="#e74c3c" style="padding: 20px; text-align: center; color: #ffffff; border-top-left-radius: 8px; border-top-right-radius: 8px;">
                                        <h1 style="margin: 0; font-size: 24px; font-family: Arial, sans-serif;">Certificate Validation Failed</h1>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 20px; font-family: Arial, sans-serif; color: #444;">
                                        <p style="line-height: 1.6;">We could not validate a certificate based on the information provided. There is no certificate associated with the email address <strong>{email}</strong> and certificate number <strong>{certificate_number}</strong> you entered.</p>
                                        <p style="line-height: 1.6;">Please double-check the information and try again. If you believe this is an error or need further assistance, feel free to contact us at <a href="mailto:info@webxter.in" style="color: #fbc531; text-decoration: none;">info@webxter.in</a> or call us at +91 735-501-7830.</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td bgcolor="#e74c3c" style="padding: 20px; text-align: center; color: #ffffff; border-bottom-left-radius: 8px; border-bottom-right-radius: 8px;">
                                        <p style="margin: 0;">For more information or to explore other courses, visit our website: <a href="https://webxter.in" style="color: #fbc531; text-decoration: none;">Webxter.in</a></p>
                                        <p style="margin: 0;">© 2024 Webxter. All rights reserved.</p>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </body>
            </html>


        """
        return template


def get_quote_template(name,course_name,phone_number,message):
    template = f"""

        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Quote Request Confirmation</title>
        </head>
        <body style="background-color: #f8f8f8; margin: 0; padding: 0;">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#f8f8f8">
                <tr>
                    <td>
                        <table width="600" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff" align="center" style="border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
                            <tr>
                                <td bgcolor="#273c75" style="padding: 20px; text-align: center; color: #ffffff; border-top-left-radius: 8px; border-top-right-radius: 8px;">
                                    <h1 style="margin: 0; font-size: 24px; font-family: Arial, sans-serif;">Quote Request Received!</h1>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 20px; font-family: Arial, sans-serif; color: #444;">
                                    <h2 style="color: #273c75;">Hi {name},</h2>
                                    <p style="line-height: 1.6;">Thank you for requesting a quote. We have received your request and our team is currently reviewing the details. You will receive a response shortly.</p>
                                    <p style="line-height: 1.6;">Here is a summary of your request:</p>
                                    <ul style="line-height: 1.6; padding-left: 20px;">
                                        <li><strong>Course:</strong> {course_name}</li>
                                        <li><strong>Phone Number:</strong> {phone_number}</li>
                                        <li><strong>Message:</strong> {message}</li>
                                    </ul>
                                    <p style="line-height: 1.6;">If you have any urgent inquiries, feel free to contact us at <a href="mailto:info@webxter.in" style="color: #fbc531; text-decoration: none;">info@webxter.in</a> or call us at +91 735-501-7830.</p>
                                </td>
                            </tr>
                            <tr>
                                <td bgcolor="#273c75" style="padding: 20px; text-align: center; color: #ffffff; border-bottom-left-radius: 8px; border-bottom-right-radius: 8px;">
                                    <p style="margin: 0;">Need more information? Visit our website: <a href="https://webxter.in" style="color: #fbc531; text-decoration: none;">Webxter.in</a></p>
                                    <p style="margin: 0;">© 2024 Webxter. All rights reserved.</p>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </body>
        </html>

    """
    return template


def newsletter_template(name):
    template = f"""

    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Newsletter Signup Confirmation</title>
    </head>
    <body style="background-color: #f8f8f8; margin: 0; padding: 0;">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#f8f8f8">
            <tr>
                <td>
                    <table width="600" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff" align="center" style="border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
                        <tr>
                            <td bgcolor="#273c75" style="padding: 20px; text-align: center; color: #ffffff; border-top-left-radius: 8px; border-top-right-radius: 8px;">
                                <h1 style="margin: 0; font-size: 24px; font-family: Arial, sans-serif;">Newsletter Signup Confirmed!</h1>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding: 20px; font-family: Arial, sans-serif; color: #444;">
                                <h2 style="color: #273c75;">Hi {name},</h2>
                                <p style="line-height: 1.6;">Thank you for subscribing to our newsletter at Webxter! We’re excited to keep you updated with the latest news, exclusive offers, and valuable insights.</p>
                                <p style="line-height: 1.6;">You’ll be receiving our newsletters in your inbox shortly. If you have any questions or need assistance, feel free to contact us at <a href="mailto:info@webxter.in" style="color: #fbc531; text-decoration: none;">info@webxter.in</a> or call us at +91 735-501-7830.</p>
                                <p style="line-height: 1.6;">In the meantime, feel free to explore our website: <a href="https://webxter.in" style="color: #fbc531; text-decoration: none;">Webxter.in</a></p>
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#273c75" style="padding: 20px; text-align: center; color: #ffffff; border-bottom-left-radius: 8px; border-bottom-right-radius: 8px;">
                                <p style="margin: 0;">© 2024 Webxter. All rights reserved.</p>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </body>
    </html>

    """
    return template


def course_registeration_template(name,course,date_slot):
    template = f"""

        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Course Registration Confirmation</title>
        </head>
        <body style="background-color: #f8f8f8; margin: 0; padding: 0;">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#f8f8f8">
                <tr>
                    <td>
                        <table width="600" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff" align="center" style="border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
                            <tr>
                                <td bgcolor="#273c75" style="padding: 20px; text-align: center; color: #ffffff; border-top-left-radius: 8px; border-top-right-radius: 8px;">
                                    <h1 style="margin: 0; font-size: 24px; font-family: Arial, sans-serif;">Course Registration Confirmed!</h1>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 20px; font-family: Arial, sans-serif; color: #444;">
                                    <h2 style="color: #273c75;">Hi {name},</h2>
                                    <p style="line-height: 1.6;">Thank you for registering for our course at Webxter! We're thrilled to have you on board and look forward to helping you achieve your learning goals.</p>
                                    <p style="line-height: 1.6;">Here are the details of your registration:</p>
                                    <ul style="line-height: 1.6; padding-left: 20px;">
                                        <li><strong>Course Name:</strong> {course.course_name}</li>
                                        <li><strong>Start Date:</strong> {date_slot}</li>
                                        <li><strong>Duration:</strong> {course.duration} (weeks)</li>
                                        <li><strong>Mode:</strong> Online</li>
                                    </ul>
                                    <p style="line-height: 1.6;">You will receive further instructions and materials closer to the start date. In the meantime, if you have any questions or need assistance, please don't hesitate to reach out to us at <a href="mailto:info@webxter.in" style="color: #fbc531; text-decoration: none;">info@webxter.in</a> or call us at +91 735-501-7830.</p>
                                </td>
                            </tr>
                            <tr>
                                <td bgcolor="#273c75" style="padding: 20px; text-align: center; color: #ffffff; border-bottom-left-radius: 8px; border-bottom-right-radius: 8px;">
                                    <p style="margin: 0;">Explore more courses and resources on our website: <a href="https://webxter.in" style="color: #fbc531; text-decoration: none;">Webxter.in</a></p>
                                    <p style="margin: 0;">© 2024 Webxter. All rights reserved.</p>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </body>
        </html>
        """

    return template


def admin_template(name,email,form_type):
    template = f"""

    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>New Course Enrollment</title>
    </head>
    <body style="background-color: #f8f8f8; margin: 0; padding: 0;">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#f8f8f8">
            <tr>
                <td>
                    <table width="600" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff" align="center" style="border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
                        <tr>
                            <td bgcolor="#273c75" style="padding: 20px; text-align: center; color: #ffffff; border-top-left-radius: 8px; border-top-right-radius: 8px;">
                                <h1 style="margin: 0; font-size: 24px; font-family: Arial, sans-serif;">New Form Submission</h1>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding: 20px; font-family: Arial, sans-serif; color: #444;">
                                <h2 style="color: #273c75;">Hello Admin,</h2>
                                <p style="line-height: 1.6;">You have a new form submission on Webxter.</p>
                                <p style="line-height: 1.6;">Here are the details:</p>
                                <ul style="line-height: 1.6; padding-left: 20px;">
                                    <li><strong>User Name:</strong> {name}</li>
                                    <li><strong>Email:</strong> {email}</li>
                                    <li><strong>Form Type:</strong> {form_type}</li>
                                </ul>
                                <p style="line-height: 1.6;">Please log into your admin panel to view more details or respond to this submission.</p>
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#273c75" style="padding: 20px; text-align: center; color: #ffffff; border-bottom-left-radius: 8px; border-bottom-right-radius: 8px;">
                                <p style="margin: 0;">Admin Portal: <a href="https://webxter.in/admin" style="color: #fbc531; text-decoration: none;">Login Here</a></p>
                                <p style="margin: 0;">For any issues, contact support at <a href="mailto:support@webxter.in" style="color: #fbc531; text-decoration: none;">support@webxter.in</a></p>
                                <p style="margin: 0;">© 2024 Webxter. All rights reserved.</p>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </body>
    </html>


    """
    return template




