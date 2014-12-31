<?php

use \Phalcon\Tag as Tag,
    \Phalcon\Mvc\Model\Criteria;

class CategoriesController extends ControllerBase
{

    public function indexAction()
    {
         $this->persistent->parameters = null;
    }

    public function searchAction()
    {

        $numberPage = 1;
        if ($this->request->isPost()) {
            $query = Criteria::fromInput($this->di, "Categories", $_POST);
            $this->persistent->parameters = $query->getParams();
        } 
        else {
            $numberPage = $this->request->getQuery("page", "int");
            if ($numberPage <= 0) {
                $numberPage = 1;
            }
        }

        $parameters = $this->persistent->parameters;
        if (!is_array($parameters)) {
            $parameters = array();
        }        
        $parameters["order"] = "id";
        
        $categories = Categories::find($parameters);
        if (count($categories) == 0) {
            $this->flash->notice("The search did not find any category");
            return $this->dispatcher->forward(array(
                "controller" => "categories",
                "action" => "index"
            ));
        }

        $paginator = new \Phalcon\Paginator\Adapter\Model(array(
            "data" => $categories,
            "limit"=> 10,
            "page" => $numberPage
        ));

        $this->view->page = $paginator->getPaginate();
    }

    public function newAction()
    {

    }

    /**
     * Edit Category entry
     * @param int $id Category identifier
     * @return type
     */
    public function editAction($id)
    {

        $request = $this->request;
        if (!$request->isPost()) {

            $categories = Categories::findFirst(array(
                'id = :id:',
                'bind' => array('id' => $id)
            ));
            if (!$categories) {
                $this->flash->error("The category was not found");
                return $this->dispatcher->forward(array(
                    "controller" => "categories",
                    "action" => "index"
                ));
            }
            $this->view->setVar("id", $categories->id);

            $this->tag->setDefault("id", $categories->id);
            $this->tag->setDefault("name", $categories->name);
            $this->tag->setDefault("slug", $categories->slug);
        }
    }

    /**
     * Create new Category entry
     * @return type Forward
     */
    public function createAction()
    {

        if (!$this->request->isPost()) {
            return $this->dispatcher->forward(array(
                "controller" => "categories",
                "action" => "index"
            ));
        }

        $categories = new Categories();
        $categories->id = $this->request->getPost("id");
        $categories->name = $this->request->getPost("name");
        $categories->slug = $this->request->getPost("slug");
        if (!$categories->save()) {
            foreach ($categories->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
            return $this->dispatcher->forward(array(
                "controller" => "categories",
                "action" => "new"
            ));
        } else {
            $this->flash->success("The category was created successfully");
            return $this->dispatcher->forward(array(
                "controller" => "categories",
                "action" => "index"
            ));
        }

    }

    public function saveAction()
    {

        if (!$this->request->isPost()) {
            return $this->dispatcher->forward(array(
                "controller" => "categories",
                "action" => "index"
            ));
        }

        $category = Categories::findFirst(array(
            'id = :id:',
            'bind' => array('id' => $this->request->getPost("id"))
        ));
        if (!$category) {
            $this->flash->error("The category does not exist");
            return $this->dispatcher->forward(array(
                "controller" => "categories",
                "action" => "index"
            ));
        }
        
        $category->name = $this->request->getPost("name");
        $category->slug = $this->request->getPost("slug");

        if (!$category->save()) {
            foreach ($category->getMessages() as $message) {
                $this->flash->error((string) $message);
            }
            return $this->dispatcher->forward(array(
                "controller" => "categories",
                "action" => "edit",
                "params" => array($categories->id)
            ));
        } else {
            $this->flash->success("Category was updated successfully");
            return $this->dispatcher->forward(array(
                "controller" => "categories",
                "action" => "index"
            ));
        }

    }

    public function deleteAction($id)
    {

        $categories = Categories::findFirst(array(
            'id = :id:',
            'bind' => array('id' => $id)
        ));
        if (!$categories) {
            $this->flash->error("The category was not found");
            return $this->dispatcher->forward(array(
                "controller" => "categories",
                "action" => "index"
            ));
        }

        if (!$categories->delete()) {
            foreach ($categories->getMessages() as $message){
                $this->flash->error((string) $message);
            }
            return $this->dispatcher->forward(array(
                "controller" => "categories",
                "action" => "search"
            ));
        } else {
            $this->flash->success("The category was deleted");
            return $this->dispatcher->forward(array(
                "controller" => "categories",
                "action" => "index"
            ));
        }
    }

}
