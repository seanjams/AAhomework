import React from 'react';

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
  }

  // clicked() {
  //   const todo = this.props.todo;
  //   this.done = !this.done;
  // }

  render() {
    const todo = this.props.todo;
    return(
      <li>{ todo.title }
        <button onClick={() => this.props.removeTodo(todo)}>DELETE ME</button>
        
        <br/>
        {todo.body}

      </li>
    );
  }
}

export default TodoListItem;
