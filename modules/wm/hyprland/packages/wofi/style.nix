{theme}: ''
  window {
      margin: 0px;
      border-radius: 8px;
      background-color: ${theme.backgroundColor};
      box-shadow: ${theme.backgroundColor} 0px 5px 15px;
  }

  #input {
      margin: 5px;
      border: none;
      color: ${theme.textColor};
      background-color: ${theme.backgroundColor};
      border-radius: 8px;
      border: solid 1px ${theme.focusColor};
      padding: 4px;
      padding-left: 10px;
  }

  #inner-box {
      margin: 5px;
      border: none;
      background-color: ${theme.backgroundColor2};
      border-radius: 8px;
  }

  #outer-box {
      margin: 1px;
      border: none;
      background-color: ${theme.backgroundColor2};
      border-radius: 8px;
  }

  #scroll {
      border-radius: 8px;
  }

  #text {
      margin-left: 7px;
      border: none;
      color: ${theme.textColor};
  }

  #entry {
      padding: 10px;
      border-radius: 8px;
  }

  #entry:selected,
  #img:selected,
  #text:selected {
      background-color: ${theme.backgroundColor3};
  }

''
