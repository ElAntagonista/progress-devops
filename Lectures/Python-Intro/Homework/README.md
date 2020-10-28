
# Prerequisites
1. Your github repo where you'd commit your work
2. From the master branch create a branch called `DEVOPS-Python-Intro`
3. Work in the newly created branch
4. When ready create a pull request and invite me as a reviewer
5. Please check the notes on the github setup [here](../../Bash-Intro/Homework/README.md)

----------

## Tasks

### Task-1

Given the below json, create a python object (choose appropriate data type) to represent it appropriately.

```
{
"_id": "5f8f0e3cd00931579ab05201",
"index": 1,
"guid": "e560f9dd-c3f5-4d35-8554-10fdc701bcb6",
"isActive": true,
"balance": "$3,927.05",
"picture": "http://placehold.it/32x32",
"age": 20,
"eyeColor": "blue",
"name": "Jenny Bailey",
"gender": "female",
"company": "ECSTASIA",
"email": "jennybailey@ecstasia.com",
"phone": "+1 (836) 436-3687",
"address": "787 Troy Avenue, Harleigh, Hawaii, 6761",
"tags": [
  "labore",
  "amet",
  "eiusmod",
  "do",
  "ipsum",
  "ipsum",
  "ut"
],
"friends": [
  {
    "id": 1,
    "name": "Deleon Dillard"
  },
  {
    "id": 2,
    "name": "Johnson Curtis"
  }
],
}
```

### Task-2

Write a python function that will take an array as an argument. For each element
in the array it should print out the index of the item as well as the item itself.
If the array is empty print the following statement - "Can not print an empty array" 


### Task-3
Write a simple CLI tool that will implement a small subset of curl capabilities.
Your CLI should have 2 arguments - HTTP-METHOD and URL.
Your CLI tool would support only "GET" method (the CLI should make sure a proper value for HTTP_METHOD is supplied)
The output of the tool should be:

HTTP Status-Line 

HTTP HEADERS

Content Body

Example:
`curl.py -m GET https://google.com`

Output:
```
 HTTP/1.1 200 OK

 Date: Wed, 28 Oct 2020 15:38:14 GMT
 Expires: -1
 Cache-Control: private, max-age=0
 Content-Type: text/html; charset=ISO-8859-1
 Server: gws
 X-XSS-Protection: 0
 X-Frame-Options: SAMEORIGIN
 Accept-Ranges: none
 Vary: Accept-Encoding
 Transfer-Encoding: chunked

 <html>Content<html>
