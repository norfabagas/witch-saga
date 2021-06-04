import React, { useEffect, useState } from 'react';
import ReactDOM from 'react-dom';
import WelcomeMessage from './welcome_message';

const HomeIndex = () => {
  const [welcome, setWelcome] = useState([]);
  const [solution, setSolution] = useState('');

  const [name1, setName1]  = useState('');
  const [age1, setAge1]  = useState('');
  const [death1, setDeath1]  = useState('');
  
  const [name2, setName2]  = useState('');
  const [age2, setAge2]  = useState('');
  const [death2, setDeath2]  = useState('');

  async function fetchWelcomeMsg() {
    const response = await fetch('/api/v1.json');
    const messages = await response.json();
    return messages;
  }

  async function fetchSolution(name1, age1, death1, name2, age2, death2) {
    const response = await fetch('/api/v1/solution.json', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        "name_1": name1,
        "age_of_death_1": age1,
        "year_of_death_1": death1,
        "name_2": name2,
        "age_of_death_2": age2,
        "year_of_death_2": death2
      })
    })
    const solution = await response.json();
    return solution;
  }

  const checkSolution = (name1, age1, death1, name2, age2, death2) => {
    if (validateInput(name1, age1, death1, name2, age2, death2)) {
      setSolution('please wait...');
      fetchSolution(name1, age1, death1, name2, age2, death2)
        .then(solution => {
          console.log(solution);
          setSolution(solution.result);
        });
    }
  }

  const validateInput = (name1, age1, death1, name2, age2, death2) => {
    if (name1 === "") {
      setSolution('please fill name of first person');
      return false;
    }
    
    if (name2 === "") {
      setSolution('please fill name of second person');
      return false;
    }
    
    if (age1 === "") {
      setSolution('please fill age of first person');
      return false;
    }
    
    if (age2 === "") {
      setSolution('please fill age of second person');
      return false;
    }
    
    if (death1 === "") {
      setSolution('please fill death year of first person');
      return false;
    }
    
    if (death2 === "") {
      setSolution('please fill death year of second person');
      return false;
    }

    return true;
  }

  useEffect(() => {
    fetchWelcomeMsg().then(messages => {
      console.log(messages);
      setWelcome(messages);
    })
  }, []);

  return <div>
    <WelcomeMessage messages={welcome}/>

    <hr />

    <div className="row">

      <div className="form-group col-6">
        <input 
          type="name" 
          placeholder="Name of first person" 
          className="form-control" 
          value={name1}
          onChange={e => setName1(e.target.value)} />
        
        <input 
          type="number" 
          placeholder="Age of Death" 
          className="form-control" 
          value={age1}
          onChange={e => setAge1(e.target.value)} />
        
        <input 
          type="number" 
          placeholder="Year of Death" 
          className="form-control" 
          value={death1}
          onChange={e => setDeath1(e.target.value)} />
      </div>

      <div className="form-group col-6">
        <input
          type="name"
          placeholder="Name of second person"
          className="form-control"
          value={name2}
          onChange={e => setName2(e.target.value)} />

        <input
          type="number"
          placeholder="Age of Death"
          className="form-control"
          value={age2}
          onChange={e => setAge2(e.target.value)} />

        <input
          type="number"
          placeholder="Year of Death"
          className="form-control"
          value={death2}
          onChange={e => setDeath2(e.target.value)} />
      </div>

    </div>

    <br />

    <div className="col-12 text-center">
      <button 
        className="btn btn-success btn-md"
        onClick={() => checkSolution(name1, age1, death1, name2, age2, death2)}
      >
        Check
      </button>
    </div>

    <h1 className="text-center">
      {solution}
    </h1>

  </div>;
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <HomeIndex />,
    document.body.appendChild(document.createElement('div')),
  )
})