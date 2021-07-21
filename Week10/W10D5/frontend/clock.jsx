import React from 'react';

class Clock extends React.Component {
    constructor(props) {
        super(props);
        this.state = {time: new Date()};
        this.tick = this.tick.bind(this);
    }

    tick() {
        this.setState({time: new Date()})
    }

    componentDidMount() {
       this.intervalId = setInterval(this.tick, 1000)
    }

    componentWillUnmount() {
        clearInterval(this.intervalId);
    }

    render() {
        let hours = this.state.time.getHours();
        let minutes = this.state.time.getMinutes();
        let seconds = this.state.time.getSeconds();

        return (
            <div id="clock"> 
                {/* <h1>Clock</h1> */}
                <div id="inner-clock">

                    <p><span id="time">
                        Time:
                    </span>
                    <span>
                        {hours}: {minutes}: {seconds}
                    </span>
                    </p>

                    <p><span id="time">
                            Date:
                        </span>
                        <span>
                            {this.state.time.toDateString()}
                        </span>
                    </p>
                </div>
            </div>
        )
    }
}



export default Clock;