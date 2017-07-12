import React from 'react';
import uniqueId from '../../util/util';

class TodoForm extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      title: "",
      body: "",
      done: false
    };
    this.setTitle = this.setTitle.bind(this);
    this.setBody = this.setBody.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  setTitle(e) {
    e.preventDefault();
    let newTitle = e.target.value;
    this.setState({ title: newTitle });

  }
  setBody(e) {
    e.preventDefault();
    let newBody = e.target.value;
    this.setState({ body: newBody });
  }



  handleSubmit(e) {
    e.preventDefault();
    const todo = Object.assign({}, this.state, { id: uniqueId()});
    this.props.receiveTodo(todo);
    this.setState ({
      title: "",
      body: ""
    });
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <label>Title
          <input onChange={this.setTitle} value={this.state.title}></input>
        </label>

        <br/>

        <label>Body
          <textarea onChange={this.setBody} value={this.state.body}></textarea>
        </label>


        <button>Create Todo!!!</button>
      </form>
    );
  }
}

export default TodoForm;
