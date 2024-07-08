import os
from langchain_community.document_loaders import PyPDFLoader
from langchain.text_splitter import RecursiveCharacterTextSplitter
from langchain_huggingface import HuggingFaceEmbeddings
from langchain_community.vectorstores import FAISS
from langchain.chains import RetrievalQA
from langchain_groq import ChatGroq

# Set your Groq API key
os.environ["GROQ_API_KEY"] = "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"

# Load the PDF
loader = PyPDFLoader("./BDA/BDA_SENIOR.pdf")
documents = loader.load()

print(f"Loaded PDF with {len(documents)} pages.")

# Split the text into chunks
text_splitter = RecursiveCharacterTextSplitter(chunk_size=1000, chunk_overlap=200)
texts = text_splitter.split_documents(documents)

print(f"Split the text into {len(texts)} chunks.")

# Create embeddings
embeddings = HuggingFaceEmbeddings()

print("Creating embeddings...")

# Create a vector store
vectorstore = FAISS.from_documents(texts, embeddings)

print("Created vector store.")

# Initialize the Groq model
llm = ChatGroq(model_name="mixtral-8x7b-32768", temperature=0)

# Create a retrieval-based QA chain
qa_chain = RetrievalQA.from_chain_type(
    llm=llm,
    chain_type="stuff",
    retriever=vectorstore.as_retriever(),
    return_source_documents=True
)

# Function to ask questions
def ask_question(question):
    result = qa_chain({"query": question})
    return result["result"]

# Example usage
if __name__ == "__main__":
    while True:
        user_question = input("Ask a question about the PDF (or type 'exit' to quit): ")
        if user_question.lower() == 'exit':
            break
        answer = ask_question(user_question)
        print(f"Answer: {answer}\n")