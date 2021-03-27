@teddy_bear = Product.find_or_create_by({name: "Teddy Bear", description: "A Fully Completed Teddy Bear"})
@stuffing = Product.find_or_create_by({name: "Stuffing", description: "Teddy Bear Stuffing"})
@fur = Product.find_or_create_by({name: "Faux Bear Fur", description: "Teddy Bear Fur"})
