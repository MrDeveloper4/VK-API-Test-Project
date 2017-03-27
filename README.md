# VK-API-Test-Project

General Task: Using VK API create image viewer.
Major requirements:
- Login Screen
- Albums screen(just a list with an album cover)
- Photos screen(just a list with an image cover)
- Single full size image viewer
- Indicator loaders

My tips:
- I had no need to inject all my managers from class to class, but in other case I would have added "Swinject" to make a beutiful dependency injection.
- It would be better to ignore pods by GitHub.
- I didn't use pure VK API, I used a wrapper SwiftyVk, It lets me avoid some boring moments like creating a URL Router and more complex response handling with Alamofire.
- I tried to handle the majority of possible errors(internet connection, incorrect responses) using special managers.
