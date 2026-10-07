# 03. Python automation

Python is the usual next step after shell when a task needs HTTP, argument parsing, or a test runner. The examples here came from test-automation work: a small upload server, a TestRail API client, and Selenium checks against a browser grid.

## What is in here

| Path | Contents |
| --- | --- |
| `http/get_post_http.py` | A Python 3 `http.server` variant that accepts a file upload |
| `cli/pyprog.py` | `argparse` for a username, password, plan id, and URL |
| `testrail/` | Gurock's TestRail API v2 client (`testrail.py`) and two callers. Usernames in the callers are placeholders (`learner@example.com`) |
| `selenium/pytest/` | A unittest that opens Google through a local Selenium hub |
| `selenium/python3_RH_initial/` | Docker image and scripts that run the same style of smoke test on a user-defined network |
| `selenium/docker-compose-selenium.yml` | Selenium Hub plus Chrome and Firefox nodes (images from the 3.11 line) |

`testrail.py` is the upstream TestRail binding (copyright Gurock Software GmbH). Keep its license terms with it if you redistribute that file alone.

## How to run the examples

You need Python 3. For the server, from this directory:

```bash
python3 http/get_post_http.py 8000
```

That listens on your machine. Stop it when you are done. Do not expose it on a shared network; the upload handler is a teaching sample, not a hardened service.

Argument parsing, without sending the password anywhere:

```bash
python3 cli/pyprog.py -u learner@example.com -p 'do-not-use-a-real-password' --tpid R1 --url https://example.testrail.net
```

The script prints the password back out. That is a bug you should fix in the exercises, not a pattern to copy.

Selenium needs Docker:

```bash
docker compose -f selenium/docker-compose-selenium.yml up -d
python3 selenium/pytest/google_conn.py
docker compose -f selenium/docker-compose-selenium.yml down
```

The grid images are old. If they fail to start, the lesson is the shape of the test (`webdriver.Remote`, a hub URL, an assertion on the title), not those exact tags. Read `selenium/python3_RH_initial/README` for the earlier manual `docker run` variant.

The TestRail callers talk to a real TestRail instance only if you pass your own URL and credentials. Nothing in this folder should contain a live password.

## Practice

1. Change `cli/pyprog.py` so it never prints the password, and so a missing password is read from the terminal with `getpass` instead of being required on the command line.
2. Add a `--port` argument to `http/get_post_http.py` and refuse to bind anything other than `127.0.0.1`.
3. Point `selenium/pytest/google_conn.py` at a page you host locally and assert on a title you control. Do not build tests that depend on Google's homepage staying the same.
4. Read `testrail/testrail.py` and list the HTTP methods the client wraps. Describe how you would load the username and password from the environment instead of from source code.
