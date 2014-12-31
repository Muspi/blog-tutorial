{{ content() }}

{{ form("categories/save") }}

	<table width="100%">
            <tr>
                <td align="left">{{ link_to("categories", "Back", "class" : "btn") }}</td>
                <td align="right">{{ submit_button("Save", "class" : "btn") }}</td>
            <tr>
	</table>

        {{ hidden_field("id") }}
	<div align="center">
            <h1>Edit categories</h1>
	</div>

	<table align="center">
            <tr>
                <td align="right">
                    <label for="name">Name</label>
                </td>
                <td align="left">
                    {{ text_field("name", "size": 30) }}
                </td>
            </tr>
            <tr>
                <td align="right">
                    <label for="slug">Slug</label>
                </td>
                <td align="left">
                        {{ text_field("slug", "size" : 30) }}
                </td>
            </tr>
	</table>

{{ end_form() }}
