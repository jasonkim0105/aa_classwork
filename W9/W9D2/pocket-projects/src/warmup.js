
const partyHeader = document.getElementById('party');

export const htmlGenerator = (string, htmlElement) => {
  const p = document.createElement("p");
  p.append(string);
  htmlElement.append(p);
};

htmlGenerator('Party Time.', partyHeader);