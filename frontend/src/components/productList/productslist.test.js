import React from 'react';
import ReactDOM from 'react-dom';
import productlist from './productlist';

it('renders without crashing', () => {
  const div = document.createElement('div');
  ReactDOM.render(<productlist />, div);
  ReactDOM.unmountComponentAtNode(div);
});
