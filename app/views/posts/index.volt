{{ content() }}

<p>
    <table class="table">
        <tr>
            <th>Title</th>
            <th>Created</th>
        </tr>
        {% for post in posts %}
        <tr>
            <td>{{ post.title }}</td>
            <td>{{ post.created }}</td>
            <td>{{ link_to('posts/show/'~post.id~'/'~post.slug, 'Details') }}</td>
        </tr>
        {% endfor %}
    </table>
</p>