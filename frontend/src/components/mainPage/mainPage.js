import React from 'react';
import { NavLink, Routes, Route } from 'react-router-dom';
import './mainPage.css';
import Customers from '../customers/customer.js'
import PrivateRoutes from '../privateRoutes/PrivateRoutes.js'


const mainPage = (props) => (
  <div className='app'>
    <h1>E-Commerce System</h1>
    <Navigation />
    <Main />
  </div>
);

const Navigation = () => (
  <nav>
    <ul>
      <li><NavLink exact activeClassName="current" to='/customer'>customer</NavLink></li>
      <li><NavLink exact activeClassName="current" to='/store'>Store</NavLink></li>
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
    <Route exact path='/customer' element={ <Customers/>}></Route>
    <Route exact path='/store' element={<Contact/>}></Route>
  </Routes>
);

export default mainPage;