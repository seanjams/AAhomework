import React from 'react';

class TodoListItem extends React.Component {


  toggleDone() {
    const todo = this.props.todo;
    this.props.receiveTodo(Object.assign({}, todo, {done: !todo.done}));
  }



  render() {
    const todo = this.props.todo;
    const buttonText = todo.done ? "Undo" : "Done";
    return(
      <li className="item">
        <div className="title">
          { todo.title }
          <div className="buttons">
            <button onClick={() => this.props.removeTodo(todo)}>DELETE ME</button>
            <button onClick={this.toggleDone.bind(this)}>{buttonText}</button>
          </div>
        </div>
        <div className="body">
          { todo.body }
        </div>
      </li>
    );
  }
}

export default TodoListItem;
