// There is only one class called App
// the constructor() does initialzation job
// handleChange() is triggered when input changes
// handleClick() is triggered when clicking any buttons
// render() inlude the page desgin
// you may want to start read render() first
import React from 'react';
import { 
    Row, Col, Button,
    Card,  CardBody, CardHeader, CardFooter,
    Input, InputGroup, InputGroupAddon,
    } 
    from 'reactstrap';
import './register.css';

class customer extends React.Component {
  // ######################### initialzation ###########################
  constructor(props) {
    super(props);
    this.state = {
        "customerID": "",
        "name": "",
        "State": "",
        "City" :"",
        "Street":"",
        "ZIP":"",
        "Phone" :"",
        "httpStatus": 0,
        "errorMsg": ""
        };
    this.handleClick = this.handleClick.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  // ######################### input handler ###########################
  handleChange(event) {
    const inputId = event.target.id;
    const inputValue = event.target.value;
    let state = this.state;
    state[inputId] = inputValue;
    this.setState(state);
  }

  // ######################### click handler ###########################
  handleClick(event) {
    const serverUrl = "http://localhost:5000/registe";
    const debugUrl = "http://localhost:5000/debug";
    const buttonId = event.target.id;
    let state = this.state
    // ######################### create name ###########################
    if (buttonId === "create") {
      fetch(serverUrl, {
        method: 'POST',
        body: JSON.stringify({
            "customerID": state["customerID"],
            "name": state["name"],
            "state": state["State"],
            "city" : state["City"],
            "street":state["Street"],
            "phone" : state["Phone"],
            "zip": state["ZIP"],
            })
      })
      .then(response => {
        state["httpStatus"] = response.status;
        state["errorMsg"] = response.statusText;
        if (response.status < 300) {
          return response.json();
        }
        return {}
      })
      .then(object => {
          // console.log(object);
          if (state["httpStatus"] < 300) {
            state["customerID"]= object["customerID"];
            state["name"]= object["name"];
            state["State"]= object["state"];
            state["City"] = object["city"];
            state["Street"]=object["street"];
            state["ZIP"]= object["zip"];
            state["Phone"]= object["phone"];
          }
          this.setState(state);
      })
      .catch(error => {
        console.log(error);
        state["customerID"]= "";
        state["name"]= "";
        state["State"]= "";
        state["City"] = "";
        state["Street"]= "";
        state["ZIP"]= "";
        state["Phone"] = "";
        state["errorMsg"] = error;
        this.setState(state);
      });    
    }

   
    // ######################### debug method ###########################
    else if (buttonId === "debug") {
      fetch(debugUrl, { 
        method: 'GET'
      })
      .then(response => {
        // console.log(response);
        state["httpStatus"] = response.status;
        state["errorMsg"] = response.statusText;
        if (response.status < 300) {
          return response.json();
        }
        return {}
      })
      .then(object => {
          // console.log(object);
          if (state["httpStatus"] < 300) {
            state["errorMsg"] = JSON.stringify(object);
          }
          this.setState(state);
      })
      .catch(error => {
        // console.log(error);
        state["name"]= "";
        state["state"]= "";
        state["city"] = "";
        state["street"]= "";
        state["zip"]= "";
        state["errorMsg"] = error;
        this.setState(state);
      });    
    }
  }

  // ######################### page design ###########################
  render() {
    const state = this.state;
    return (
    <Row> <Col sm={{ size: 6, offset: 3 }}> <Card className='mt-5'>
        <CardHeader tag="h3">Welcome</CardHeader>
        <CardBody>
          <InputGroup>
            <InputGroupAddon addonType="prepend">E-mail:</InputGroupAddon>
            <Input value={state["customerID"]} onChange={this.handleChange} id="customerID"/>
          </InputGroup> <br />
          <InputGroup>
            <InputGroupAddon addonType="prepend">Name: </InputGroupAddon>
            <Input value={state["name"]} onChange={this.handleChange} id="name"/>
          </InputGroup> <br />
          <InputGroup>
            <InputGroupAddon addonType="prepend">Phone:</InputGroupAddon>
            <Input value={state["Phone"]} onChange={this.handleChange} id="phone"/>
          </InputGroup> <br />
          <div> Main Address </div> <br />
          <InputGroup>
            <InputGroupAddon addonType="prepend">State: </InputGroupAddon>
            <Input value={state["State"]} onChange={this.handleChange} id="state"/>
          </InputGroup> <br />
          <InputGroup>
            <InputGroupAddon addonType="prepend">City: </InputGroupAddon>
            <Input value={state["City"]} onChange={this.handleChange} id="city"/>
          </InputGroup> <br />
          <InputGroup>
            <InputGroupAddon addonType="prepend">Street: </InputGroupAddon>
            <Input value={state["Street"]} onChange={this.handleChange} id="street"/>
          </InputGroup> <br />
          <InputGroup>
            <InputGroupAddon addonType="prepend">Zip: </InputGroupAddon>
            <Input value={state["ZIP"]} onChange={this.handleChange} id="zip"/>
          </InputGroup> <br />
          <Button color="success" onClick={this.handleClick} id="create">Create</Button>{" "}
        </CardBody>
      <CardFooter> 
        {"Message: " + state["errorMsg"]}
      </CardFooter>
    </Card> </Col> </Row>
    )
  }
}

export default customer;
