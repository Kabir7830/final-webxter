# React.js Overview and Concepts
<br>
## Introduction to React.js

React.js is a JavaScript library for building user interfaces, primarily single-page applications where data dynamically changes over time. It allows developers to create large web applications that can update and render efficiently in response to data changes.

### Why Use React.js?
- **Component-Based Architecture:** Build encapsulated components that manage their own state, then compose them to make complex UIs.
- **Declarative:** React makes it painless to create interactive UIs by letting you design simple views for each state in your application, and React will efficiently update and render the right components when your data changes.
- **Virtual DOM:** React uses a virtual DOM, which optimizes updates by batching them and minimizing direct manipulation of the real DOM, leading to better performance.

## Key Concepts in React.js

### 1. Components
Components are the building blocks of a React application. A component can be a function or a class that optionally takes inputs (called "props") and returns a React element that describes how a section of the UI should appear.

#### Example: Functional Component
```javascript
import React from 'react';

function Welcome(props) {
  return <h1>Hello, {props.name}</h1>;
}

export default Welcome;v