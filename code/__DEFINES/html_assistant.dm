#define HTML_SKELETON_HEAD "<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'><meta http-equiv='X-UA-Compatible' content='IE=edge'>"

#define HTML_SKELETON_RAW(head, body) \
"<!DOCTYPE html><html>[head][body]</html>"

#define HTML_SKELETON_INTERNAL(head, body) \
HTML_SKELETON_RAW("<head>[HTML_SKELETON_HEAD][head]</head>", "<body>[body]</body>")

#define HTML_SKELETON_TITLE(title, body) HTML_SKELETON_INTERNAL("<title>[title]</title>", body)
#define HTML_SKELETON(body) HTML_SKELETON_INTERNAL("", body)

#define HTML_SKELETON_PAPER(title, head, body, colour) \
"<title>[title]</title>" + HTML_SKELETON_RAW("<head>[HTML_SKELETON_HEAD][head]</head>", "<body bgcolor='[color]'>[body]</body>")
