package main

import (
	"encoding/json"
	"log"
	"math"
	"net/http"
	"strconv"
	"strings"
)

type MathCalculation struct {
	Operation    string
	FirstNumber  float64
	SecondNumber float64
	Result       float64
}

var mathOperationsHistory []MathCalculation = []MathCalculation{}

func main() {
	http.HandleFunc("/calc/", Calculator)
	http.HandleFunc("/calc/history", GetOperationsHistory)
	http.ListenAndServe(":8080", nil)
}

func Calculator(response http.ResponseWriter, request *http.Request) {
	urlPart := strings.Split(request.URL.Path, "/")

	if len(urlPart) < 5 {
		http.Error(response, "error: some arguments are not supplied", http.StatusBadRequest)
	}
	if len(urlPart) > 6 {
		http.Error(response, "error: too much arguments", http.StatusBadRequest)
	}

	x, error1 := strconv.ParseFloat(urlPart[3], 64)
	y, error2 := strconv.ParseFloat(urlPart[4], 64)

	if error1 != nil {
		http.Error(response, error1.Error(), http.StatusInternalServerError)
		log.Fatalf("error: %v", error1)
	}
	if error2 != nil {
		http.Error(response, error2.Error(), http.StatusInternalServerError)
		log.Fatalf("error: %v", error2)
	}

	calculation := MathCalculation{Operation: urlPart[2], FirstNumber: x, SecondNumber: y}
	result := Calculate(calculation)

	responseHistory, errorResponse := json.Marshal(result)
	if errorResponse != nil {
		http.Error(response, errorResponse.Error(), http.StatusInternalServerError)
	}
	response.Header().Set("Content-Type", "application/json")
	response.Write(responseHistory)
}

func Calculate(calc MathCalculation) float64 {

	switch calc.Operation {
	case "sum":
		calc.Result = Sum(calc.FirstNumber, calc.SecondNumber)
	case "sub":
		calc.Result = Sub(calc.FirstNumber, calc.SecondNumber)
	case "multi":
		calc.Result = Multi(calc.FirstNumber, calc.SecondNumber)
	case "div":
		if calc.SecondNumber == 0.0 {
			log.Fatalf("error: you tried to divide by zero.")
		}
		calc.Result = Div(calc.FirstNumber, calc.SecondNumber)
	case "pow":
		calc.Result = Pow(calc.FirstNumber, calc.SecondNumber)
	default:
		log.Fatalf("error: invalid operation!")
		calc.Result = 0.0
	}
	AddOperationToHistory(calc)
	return calc.Result
}

func AddOperationToHistory(op MathCalculation) {
	mathOperationsHistory = append(mathOperationsHistory, op)
}

func GetOperationsHistory(response http.ResponseWriter, request *http.Request) {
	responseHistory, errorResponse := json.Marshal(mathOperationsHistory)
	if errorResponse != nil {
		http.Error(response, errorResponse.Error(), http.StatusInternalServerError)
	}
	response.Header().Set("Content-Type", "application/json")
	response.Write(responseHistory)
}

func Sum(num1, num2 float64) float64 {
	return num1 + num2
}

func Sub(num1, num2 float64) float64 {
	return num1 - num2
}

func Multi(num1, num2 float64) float64 {
	return num1 * num2
}

func Div(num1, num2 float64) float64 {
	return num1 / num2
}

func Pow(num1, num2 float64) float64 {
	return math.Pow(num1, num2)
}
