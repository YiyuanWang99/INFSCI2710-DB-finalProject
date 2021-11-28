import React from 'react';
import { NavLink, Routes, Route } from 'react-router-dom';
import './App.css';
import Login from './components/login/login.js'
import Register from './components/register/register.js'
import Customers from './components/customers/customer.js'



const App = () => (
  <div className='app'>
    <h1>E-Commerce System</h1>
    <Navigation />
    <Main />
  </div>
);

const Navigation = () => (
  <nav>
    <ul>
      <li><NavLink exact activeClassName="current" to='/login'>Login</NavLink></li>
      <li><NavLink exact activeClassName="current" to='/register'>Registe</NavLink></li>
    </ul>
  </nav>
);


const Contact = () => (
  <div className='contact'>
    <h1>Contact Me</h1>
    <p>You can reach me via email: <strong>hello@example.com</strong></p>
  </div>
);

const Main = () => (
  <Routes>
    <Route exact path='/login' element={<Login/>}></Route>
    <Route exact path='/register' element={ <Register/>}></Route>
    <Route path='/customer' element={ <Customers/>}></Route>
    <Route exact path='/store' element={<Contact/>}></Route>
  </Routes>
);

export default App;