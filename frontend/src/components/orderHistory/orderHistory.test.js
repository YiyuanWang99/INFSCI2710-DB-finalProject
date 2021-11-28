import React from 'react';
import ReactDOM from 'react-dom';
import orderhistory from './orderhistory';

it('renders without crashing', () => {
  const div = document.createElement('div');
  ReactDOM.render(<orderhistory />, div);
  ReactDOM.unmountComponentAtNode(div);
});
