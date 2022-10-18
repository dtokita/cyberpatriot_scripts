@echo off

echo Checking if script was run as administrator...
net sessions
if %errorlevel% == 0 (
    echo Success!
) else (
    echo Please run script as administrator!
    PAUSE
    EXIT
)

echo "Current Account Policy:"
net accounts

REM Passwords must be at least 10 characters long
set /p "password_length=Enter minimum password length (characters): "
net accounts /minpwlen:%password_length%
echo Minimum password length set to %password_length% characters.

REM Passwords must be changed every 30 days
set /p "max_password_age=Enter the maximum password age (days): "
net accounts /maxpwage:%max_password_age%
echo Maximum password age set to %max_password_age% days.

REM Passwords must not be changed more than every 10-30 days
set /p "min_password_age=Enter the minimum password age (days): "
net accounts /minpwage:%min_password_age%
echo Minimum password age set to %min_password_age% days.

REM Enforce a password history of at least 5 passwords
set /p "min_password_history=Enter the number of unique passwords required in the password history (# of passwords): "
net accounts /uniquepw:%min_password_history%
echo Enforced password history set to %min_password_history% passwords.

REM Set the maximum number of login in attempts to 3-10
set /p "max_login_attempts=Enter the maximum number of login attempts: "
net accounts /lockoutthreshold:%max_login_attempts%
echo Account lockout threshold set to %max_login_attempts% attempts.

REM Set account lockout duration to 30 minutes
set /p "account_lockout_duration=Enter the account lockout duration (minutes): "
net accounts /lockoutduration:%account_lockout_duration%
echo Account lockout duration set to %account_lockout_duration% minutes.

REM Set account lockout window reset to 30 minutes
set /p "account_lockout_reset=Enter the account lockout reset window (minutes):"
net accounts /lockoutwindow:%account_lockout_reset%
echo Account lockout reset window set to %account_lockout_reset% minutes.

echo "New Account Policy:"
net accounts

PAUSE