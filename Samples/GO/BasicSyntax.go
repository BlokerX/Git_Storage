package main

import "fmt"

type person struct {
	name string
	age  int
}

func personInfo(p person) {
	fmt.Println("Name:", p.name)
	fmt.Println("Age:", p.age)
}

func main(){
	var myFirstVar string = "First"
	fmt.Println(myFirstVar)
	
	mySecondVar := "Second"
	fmt.Println(mySecondVar)
	
	var var1, var2, var3 = 1, 2, 3
	fmt.Println(var1, var2, var3)
	
	var4, var5, var6 := 4, 5, 6
	fmt.Println(var4, var5, var6)
	
	const pi float64 = 3.14
	fmt.Println(pi)

	intArr := [...]int32{1, 2, 3}
	fmt.Println(intArr[0])
	fmt.Println(intArr[1:3])

	fmt.Println(&intArr[0])
	fmt.Println(&intArr[1])
	fmt.Println(&intArr[2])

	persons := []person{
		{name: "Alice", age: 30},
		{name: "Bob", age: 25},
		{name: "Charlie", age: 35},
		{name: "David", age: 28},
		{name: "Eve", age: 22}
	}

	for _, p := range persons {
		if p.age > 18{
			fmt.Println("Adult: %v", p.name)
		} else {
			fmt.Println("Minor: %v", p.name)
		}
	}
}
	