import os
import streamlit as st
from langchain_community.document_loaders import PyPDFLoader
from langchain.text_splitter import RecursiveCharacterTextSplitter
from langchain_huggingface import HuggingFaceEmbeddings
from langchain_community.vectorstores import FAISS
from langchain.chains import RetrievalQA
from langchain_groq import ChatGroq

# Set your Groq API key
os.environ["GROQ_API_KEY"] = "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"

# Initialize embeddings
embeddings = HuggingFaceEmbeddings()

# Initialize the Groq model
llm = ChatGroq(model_name="mixtral-8x7b-32768", temperature=0)

def process_pdf(uploaded_file):
    # Save the uploaded file temporarily
    with open("temp.pdf", "wb") as f:
        f.write(uploaded_file.getbuffer())
    
    # Load the PDF
    loader = PyPDFLoader("temp.pdf")
    documents = loader.load()
    
    # Split the text into chunks
    text_splitter = RecursiveCharacterTextSplitter(chunk_size=1000, chunk_overlap=200)
    texts = text_splitter.split_documents(documents)
    
    # Create a vector store
    vectorstore = FAISS.from_documents(texts, embeddings)
    
    # Create a retrieval-based QA chain
    qa_chain = RetrievalQA.from_chain_type(
        llm=llm,
        chain_type="stuff",
        retriever=vectorstore.as_retriever(),
        return_source_documents=True
    )
    
    return qa_chain

def main():
    st.title("Interactive PDF Query Application")
    
    uploaded_file = st.file_uploader("Upload a PDF file", type="pdf")
    
    if uploaded_file is not None:
        qa_chain = process_pdf(uploaded_file)
        
        st.success("PDF processed successfully!")
        
        user_question = st.text_input("Ask a question about the PDF:")
        
        if user_question:
            with st.spinner("Generating answer..."):
                result = qa_chain({"query": user_question})
                st.write("Answer:", result["result"])

if __name__ == "__main__":
    main()