{{ form("posts/create", "autocomplete" : "off") }}

    <table width="100%">
        <tr>
            <td align="left"><?php echo \Phalcon\Tag::linkTo(array("categories", "Go Back", "class" => "btn")) ?></td>
            <td align="right"><?php echo \Phalcon\Tag::submitButton(array("Save", "class" => "btn")) ?></td>
        <tr>
    </table>

    <?php echo $this->getContent(); ?>

    <div align="center">
        <h1>Create a Post</h1>
    </div>

    <table align="center">
        <tr>
            <td align="right">
                <label for="title">Title</label>
            </td>
            <td align="left">
                {{ text_field("name", "size" : 30) }}
            </td>
        </tr>
        <tr>
            <td align="right">
                <label for="title">Content</label>
            </td>
            <td align="left">
                {{ text_area("content", "size" : 30) }}
            </td>
        </tr>
    </table>
{{ end_form() }}
