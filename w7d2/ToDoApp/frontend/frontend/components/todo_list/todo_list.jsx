import React from 'react';
import TodoListItem from "./todo_list_item";
import TodoForm from "./todo_form";

class TodoList extends React.Component {

  componentDidMount() {
    this.props.fetchTodos();
  }

  render() {
    const todos = this.props.todos;
    const items = todos.map((todo, i) => {
      return(
        <TodoListItem key={`todo-${i}`}
          todo={todo}
          removeTodo={this.props.removeTodo}
          receiveTodo={this.props.receiveTodo}/>
      );
    });

    return(
      <div>
        <h1>Todo List</h1>
        <ul>
          { items }
        </ul>
        <TodoForm todos={this.props.todos}
          receiveTodo={this.props.receiveTodo}/>
      </div>
    );
  }
}

export default TodoList;
