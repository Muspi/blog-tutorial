<ul class="pager">
    <li class="previous pull-left">
        {{ link_to('posts/index', '← Go back ') }}
    </li>
</ul>

<div align="center">
    <h1>
        {{ post.title }}
    </h1>
    <p>
        Category: <b>{{ post.category.name }}</b>
    </p>
    <p>
    <small>
        created {{ post.created }} by {{ post.user.login }}
    </small>
    </p>
    <p>
        {{ post.content }}
    </p>
</div>