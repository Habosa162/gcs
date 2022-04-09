module.exports=(pageNumber,data)=>{
                let limit = 5;
                let numberofResults = data.length;
                let numberOfPages = Math.ceil(numberofResults / limit);
                let skip =0 ; 
                if(pageNumber>0 && pageNumber<=numberOfPages && pageNumber!=0){
                     skip = (pageNumber-1) * limit;
                }
             

    return {skip, numberOfPages,limit}
}