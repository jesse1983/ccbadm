const React = require("react");


class BarForm extends React.Component{
	constructor(props){
		super(props);
	}
	render(){
		return (
			<div className="nga-fast nga-stagger nga-rotate-up">
				<form name="formSearch" novalidate="" role="search" className="form-search">
					<div className="form-group">
						<div className="input-group">
							<input maxlength="64" placeholder="Buscar imóvel" required="" type="search" set-focus="showSearch" className="form-control" /><span className="input-group-btn">
								<button type="submit" className="btn"><span className="fa fa-search"></span></button>
								<button className="btn"><span className="fa fa-times"></span></button></span>
						</div>
					</div>
				</form>
			</div>
		);
	}
}

module.exports = BarForm;