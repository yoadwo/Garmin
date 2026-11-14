# MoveMentor

MoveMentor is a Garmin Connect IQ **Data Field** for Strength activities. A workout plan can show the name of the active exercise without explaining how to perform it. This can be confusing when users are new to an exercise, are following a plan shared by someone else, or do not speak the plan's language.

The Data Field's core job is to identify the exercise currently active in the pre-selected workout plan and show a short, locally bundled 2-3-frame animation demonstrating it. Animation assets should be packaged with the app so the demonstrations are available on the watch.

## Project guidance

- Keep the experience focused on showing the movement for the active exercise during a Garmin Strength activity.
- Treat the exercise name from the selected workout as the input to the demonstration; do not assume a particular workout format or API until verified against the Connect IQ SDK and target devices.
- Keep animations short and suitable for display on a watch, and bundle their assets with the app.
- The generated app is configured as a Connect IQ Data Field.
- See [PLAN.MD](./PLAN.MD) for the implementation milestones.
