import axios from "axios";

const instance =axios.create({
  baseURL : "http://kubernetes-alb-982615822.us-east-1.elb.amazonaws.com/",
})

export default instance;

