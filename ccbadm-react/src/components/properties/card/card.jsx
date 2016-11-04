const React = require('react');

class Card extends React.Component {
  render() {
    return (
      <div className="col-sm-6 col-md-4 col-lg-3" key={this.props.property.id}>
        <div className="card">
          {(this.props.property.church) ?
            <img
              className="card-img-top img-fluid"
              src={this.props.property.church.picture}
              alt={this.props.property.church.name}
            />
            : <img
              className="card-img-top img-fluid"
              src={`https://dummyimage.com/400x200/777/fff&text=${this.props.property.code}`}
              alt="Sem igreja"
            />
          }
          <div className="card-block">
            {(this.props.property.church) ?
              <h4 className="card-title">{ this.props.property.church.name }</h4>
              : <h4> - </h4>
            }
            <p className="card-text">{ this.props.property.code }</p>
          </div>
          <div className="card-block">
            <a href="/users" className="card-link">Card link</a>
            <a href="/users" className="card-link">Another link</a>
          </div>
        </div>
      </div>
    );
  }
}

module.exports = Card;
