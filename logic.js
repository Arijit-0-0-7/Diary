class FooterComponent extends React.Component{
    render(){
        return(
            <div>
                <div className="bg-primary text-white text-center p-2">
                &AMP; copyright 2021
                </div>
            </div>
        );
    }
}
ReactDOM.render(<FooterComponent/>,document.getElementById("container"));
