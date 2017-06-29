class Clock {
  constructor() {
    const date = new Date();
    this.hours = date.getHours();
    this.minutes = date.getMinutes();
    this.seconds = date.getSeconds();
    setInterval(this._tick.bind(this), 1000);
    // // 4. Schedule the tick at 1 second intervals.
  }

  stringify(value) {
    if (value < 10) {
      value = "0" + value;
    }
    return value;
  }

  printTime() {
    let hours = this.stringify(this.hours);
    let minutes = this.stringify(this.minutes);
    let seconds = this.stringify(this.seconds);


    let time = `${hours}:${minutes}:${seconds}`;

    console.log(time);
    // Format the time in HH:MM:SS
    // Use console.log to print it.
  }

  _tick() {
    console.log(this);
    this.seconds++;
    if (this.seconds >= 60) {
      this.seconds = this.seconds % 60;
      this.minutes++;
      if (this.minutes >= 60) {
        this.minutes = this.minutes % 60;
        this.hours++;
        if (this.hours >= 24) {
          this.hours = this.hours % 24;
        }
      }
    }
    this.printTime();
    // 1. Increment the time by one second.
    // 2. Call printTime.
  }
}

const clock = new Clock();
