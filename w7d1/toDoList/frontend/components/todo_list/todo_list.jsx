import React from 'react';
import TodoListItem from "./todo_list_item";
import TodoForm from "./todo_form";

class TodoList extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const todos = this.props.todos;
    const items = todos.map((todo, i) => {
      return(
        <TodoListItem key={`todo-${i}`} todo={todo} removeTodo={this.props.removeTodo}/>
      );
    });

    return(
      <div>
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
