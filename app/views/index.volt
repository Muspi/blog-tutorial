<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Blog Tutorial</title>
        <link rel="stylesheet" type="text/css" href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.2.1/css/bootstrap-combined.min.css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>

        <div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </a>
                    <a class="brand" href="#">Phalcon Blog</a>
                    <div class="nav-collapse">
                        <ul class="nav pull-left">
                            <li>
                                {{ link_to('index', 'Home Page') }}
                            </li>
                            {% if session.get('auth') is not null %}
                                <li>
                                     {{ link_to('posts/index', '+Posts') }}
                                </li>
                                <li>
                                    {{ link_to('categories/index', '+Categories') }}
                                </li>
                                <li>
                                     {{ link_to('users/logout', 'Log out') }}
                                </li>
                            {% else %}
                                <li>
                                     {{ link_to('users/index', 'Log in') }}
                                </li>
                            {% endif %}
                        </ul>
                </div>
            </div>
        </div>

        {{ content() }}

        <script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.2.1/js/bootstrap.min.js"></script>
    </body>
</html>