import React from 'react';

const WelcomeMessage = (messages) => {
  const msg = messages.messages;

  return <table className="table table-hover table-striped">
    <tbody>
      <tr key="tr-1">
        <td key="td-11">
          <h3>Introduction</h3>
        </td>
        <td key="td-12">
          <h3>{msg.text}</h3>
        </td>
      </tr>

      <tr key="tr-2">
        <td key="td-21">
          <h3>Ability</h3>
        </td>
        <td key="td-22">
          <h3>{msg.ability}</h3>
        </td>
      </tr>

      <tr key="tr-3">
        <td key="td-31">
          <h3>Purpose</h3>
        </td>
        <td key="td-32">
          <h3>{msg.purpose}</h3>
        </td>
      </tr>

      <tr key="tr-4">
        <td key="td-41">
          <h3>How to do it?</h3>
        </td>
        <td key="td-42">
          <h3>{msg.how}</h3>
        </td>
      </tr>
    </tbody>
  </table>;
}

export default WelcomeMessage;