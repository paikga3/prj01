package factorybean;

import org.springframework.beans.factory.FactoryBean;

import bean.Message;

public class MessageFactoryBean implements FactoryBean<Message> {

	String text;
	
	public void setText(String text) {
		this.text = text;
	}
	
	@Override
	public Message getObject() throws Exception {
		return Message.newMessage(text);
	}

	@Override
	public Class<? extends Message> getObjectType() {
		return Message.class;
	}

	@Override
	public boolean isSingleton() {
		return false;
	}

}