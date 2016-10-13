module.exports = {
    "extends": "airbnb",
    "installedESLint": true,
    "plugins": [
        "react",
        "jsx-a11y",
        "import"
    ],
    "rules": {
    	"react/prefer-stateless-function": 0,
      "react/prop-types": 0,
      "react/jsx-no-bind": 0,
      "class-methods-use-this": 0,
      "import/no-unresolved": 0,
      "generator-star-spacing": ["error", {"before": true, "after": true}],
    }
};
