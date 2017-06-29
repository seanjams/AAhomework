function Cat(name, owner) {
  this.name = name;
  this.owner = owner;

  this.cuteStatement = function(){
    console.log(`${this.owner} loves ${this.name}`);
  };
}



// let garfield = new Cat("garfield", "john arbuckle");
// garfield.cuteStatement();

Cat.prototype.cuteStatement = function () { console.log("Everyone loves " + this.name);};
// why did the above not chane the method when it was enclosed in the constructor?
let tiger = new Cat("tiger", "john arbuckle");

tiger.cuteStatement();

Cat.prototype.meow = function(){
  console.log(`meow`);
};

Cat.prototype.meow = function(){console.log("I rule the jungle");};
