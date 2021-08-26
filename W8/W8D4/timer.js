class Clock {
  constructor() {
    // 1. Create a Date object.
    const date = new Date();
    // 2. Store the hours, minutes, and seconds.
    this.hours = date.getHours();
    this.minutes = date.getMinutes();
    this.seconds = date.getSeconds();
    // 3. Call printTime.
    this.printTime();
    // 4. Schedule the tick at 1 second intervals.
    setInterval(this._tick.bind(this), 1000);
  }

  printTime() {
    // Format the time in HH:MM:SS
    console.log(this.hours + ":" + this.minutes + ":" + this.seconds);
    // Use console.log to print it.
  }

  _tick() {
    // 1. Increment the time by one second.
    this.incrementSeconds();
    // 2. Call printTime.
    this.printTime();
  }

  incrementSeconds(){
    this.seconds++;
    if (this.seconds === 60) {
      this.seconds = 0;
      this.incrementMinutes();
    }
  }

  incrementMinutes() {
    this.minutes++;
    if (this.minutes === 60) {
      this.minutes = 0;
      this.incrementHours();
    }
  }

  incrementHours() {
    this.hours++;
    if (this.hours === 24){
      this.hours = 1;
    }
  }

}

const clock = new Clock();