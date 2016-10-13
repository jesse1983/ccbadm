const rca = function fn(animation) {
  return {
    enter: 'animated',
    enterActive: `${animation}In`,
    leave: 'animated',
    leaveActive: `${animation}Out`,
    appear: 'animated',
    appearActive: `${animation}Out`,
  };
};

module.exports = rca;
