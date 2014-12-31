{{ content() }}

<table width="100%">
    <tr>
        <td align="left">
                {{ link_to("categories/index", "Go Back", "class" : "btn") }}
        </td>
        <td align="right">
                {{ link_to("categories/new", "Create a Category", "class" : "btn") }}
        </td>
    <tr>
</table>

<table class="browse table" align="center" width="60%">
    <thead>
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Slug</th>
        </tr>
    </thead>
    <tbody>
        {% if page.items is defined %}
            {% for categories in page.items %}    
            <tr>
                <td>{{ categories.id }}</td>
                <td>{{ categories.name }}</td>
                <td>{{ categories.slug }}</td>
                <td>{{ link_to("categories/edit/"~categories.id, "Edit") }}</td>
                <td>{{ link_to("categories/delete/"~categories.id, "Delete") }}</td>
            </tr>
            {% endfor %}
        {% endif %}
    </tbody>
</table>

<div class="pagination" align="center">
    <ul>
        <li>{{ link_to("categories/search", "First") }}</li>
        <li>{{ link_to("categories/search?page="~page.before, "Previous")}}</li>
        <li>{{ link_to("categories/search?page="~page.next, "Next") }}</li>
        <li>{{ link_to("categories/search?page="~page.last, "Last") }}</li>
    </ul>
</div>
