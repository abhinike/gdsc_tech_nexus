# GDSC Tech Nova - Marks Prediction App

## Overview

GDSC Tech Nova Marks Prediction App is a Flutter application designed to help students estimate their marks based on the number of hours they've studied. The app features a simple and intuitive user interface, powered by Flutter for the frontend and Flask for the backend.

## Screenshot

![Screenshot 2024-04-29 165602](https://github.com/abhinike/gdsc_tech_nova/assets/143340791/997a83c6-e2c6-4634-a171-057de1c5a443)

## API Request and Response

### Request:
- The Flutter application sends an HTTP POST request to the prediction endpoint (`https://demo-krh2.onrender.com/predict`).
- The request body contains the number of study hours entered by the user in JSON format. For example:
  ```json
  {
      "study_hours": 5
  }
  ```
### Response:
Upon receiving the request, the server processes it and returns an HTTP response with the prediction results.
The response body is a JSON object containing two fields:
- `image_url`: A URL pointing to an image associated with the prediction result.
- `predicted_marks`: The predicted marks calculated by the system based on the study hours.
For example, the response body might look like this:
 ```json
{
    "image_url": "https://media.tenor.com/E7z9RyjC2LYAAAAe/3idiots-kya-baat-hai.png",
    "predicted_marks": 70.21164159733758
}
```


## Installation

To run this project locally, follow these steps:

```bash
# Clone this repository to your local machine
git clone https://github.com/abhinike/gdsc_tech_nova.git

# Navigate to the project directory
cd gdsc_tech_nova

# Install Flutter dependencies
flutter pub get

# Run the Flutter application
flutter run

