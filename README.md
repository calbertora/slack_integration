# SlackIntegration

**TODO: Add description**

## Installation

You need to follow the next steps in order to make it work:
1. Create a Slack Workspace
2. Create an App and add it to your Workspace
3. Create an Webhook for the channel you want to send the message
  * Features -> Incoming Webhooks -> Add New Webhook to Workspace
4. Clone the project
5. Run the docker command:
`docker build -t slack_integration .`
6. Run the docker command
```
docker run -e SLACK_WEBHOOK=https://hooks.slack.com/services/XXXXXXXXX/XXXXXXXXX/XXXXXXXXXXXXXXXXXXXXXXXX -p 8080:8080 slack_integration
```
7. Start testing from POSTMAN

```
curl --location --request POST 'localhost:8080/api/process-message' \
--header 'Content-Type: application/json' \
--data-raw '{
  "RecordType": "Bounce",
  "Type": "SpamNotification",
  "TypeCode": 512,
  "Name": "Spam notification",
  "Tag": "",
  "MessageStream": "outbound",
  "Description": "The message was delivered, but was either blocked by the user, or classified as spam, bulk mail, or had rejected content.",
  "Email": "zaphod@example.com",
  "From": "notifications@honeybadger.io",
  "BouncedAt": "2023-02-27T21:41:30Z"
}'
```
